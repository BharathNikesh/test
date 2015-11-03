require 'rubygems'
require 'pathname'
require 'sys/filesystem'
require 'fileutils'
require 'net/smtp'

class Logarchive
          attr_accessor :driveStat
          attr_accessor :driveUsed
          attr_accessor :driveUnused
          attr_accessor :driveStat
          attr_accessor :driveLocation
          attr_accessor :driveUsedPerc
          attr_accessor :driveAvail
          attr_accessor :fileAge
  
  testFileLocation = Pathname.new("/Users/bgorla/ruby_scripts/textfiles") 
  # Basic constructor method to initialize the instance variables
  def self.diskStats()
        @driveUsedPerc = driveUsedPerc
  end

# generic functin that gives you the used diskspace on the given drive
  
   def self.drivestats(dir)
         driveLocation="#{dir}"
         driveStat = Sys::Filesystem.stat"#{driveLocation}"
         driveUnused = driveStat.block_size * driveStat.blocks_available   / 1024 /1024 /1024
         driveAvail = driveStat.block_size * driveStat.blocks / 1024  / 1024 / 1024
         driveUsed = ("#{driveAvail}".to_i - "#{driveUnused}".to_i)
         @driveUsedPerc = (driveUsed.to_f/driveAvail.to_f)*100
         puts "#{@driveUsedPerc}"
   end

#if @driveUsedPerc.to_f  > 30.0 then
#  puts "Disk Space used is  greater thatn 30%"
#end


#gzip logfiles that are older than one day 
                def self.gziplogs()
                      if @driveUsedPerc.to_f  > 30.0 then
                          Dir.chdir("/Users/bgorla/ruby_scripts/textfiles")
                          logFilestobeZipped = Dir['*.txt*']
                          logFilestobeZipped.each do |file|
                          fileAge =  (Time.now.yday.to_i - File.ctime(file).yday.to_i)
                          puts ("The Log file  " + file.to_s + " is older by  " + fileAge.inspect  +   "days")
                                 if  fileAge.inspect.to_i > 1 then
                                    puts(file + " is older than one day and getting gzipped ")
                            #`gzip -9 "#{file}"`
                                 end
                      end
               end

end#class end


Logarchive.drivestats("/")
Logarchive.gziplogs()









