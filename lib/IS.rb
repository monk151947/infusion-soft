require "IS/version"
require 'xmlrpc/client'
require 'pp'
require 'yaml'

module IS

 config = YAML.load_file("config.yaml")
 @key = config["config"]["key"]
 server = config["config"]["server"]
 @server = XMLRPC::Client.new2(server)
 #method for get the data from the table

  def self.data_load(table, id, selected_fields)
       attempts = 0
     begin
        main_product = @server.call("DataService.load", @key,table, id, selected_fields)
      rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
  end

 # method to opt in email

   def self.optin(email, message)
    @server.call("APIEmailService.optIn", @key,email,message)
   end

 # method for find email from IS
   def self.findByEmail(email, contact_info)
   attempts = 0
     begin
    @server.call("ContactService.findByEmail", @key, email,contact_info)
    rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
    end

 # method for contact add
  def self.add_contact(contact)
    attempts = 0
     begin
     server.call("ContactService.add", @key, contact)
    rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
  end

  # method for update the contact_info
   def self.update(user_id, contact)
     attempts = 0
     begin
    @server.call("ContactService.update", @key,user_id,contact)
    rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
   end

 # method for merge contacts
  def self.merge(user_id, merge_id)
    attempts = 0
     begin
   @server.call("ContactService.merge", @key,user_id, merge_id)
   rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
  end

 # method for add contact to campaign
  def self.campaign(results, campaign_id)
    attempts = 0
     begin
    @server.call("ContactService.addToGroup",@key,results,campaign_id)
    rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end

  end

# find by query this method is for to check subscription
  def self.query(query, fields)
   attempts = 0
     begin
     @server.call("DataService.query",@key,"RecurringOrder",10,0,query,fields)
     rescue Exception
       attempts += 1
      retry unless attempts > 1000
       exit -1
      ensure
      puts "ensure! #{attempts}"
     end
  end

end

