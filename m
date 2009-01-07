From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Subject: Re: Mystics of packet forwarding
Date: Thu, 08 Jan 2009 00:36:20 +0200
Message-ID: <49652E64.7040303@arturaz.net>
References: <4963B3EB.6090806@arturaz.net> <496475AB.9040303@arturaz.net>	 <4964C54E.8090607@chello.at> <d39744a20901070752t45c57f98v51d04236bc81a5e8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20901070752t45c57f98v51d04236bc81a5e8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Petrushev <ivanatora@gmail.com>
Cc: Mart Frauenlob <mart.frauenlob@chello.at>, netfilter@vger.kernel.org

Ivan Petrushev wrote:
> tcpdump could be a bit overwhelming with its mass of output information.
> Maybe Wireshark?
> 
> If the case is virus/worm it could be doing port scans on the target
> sites or something that not involve port 80.
I'm lost. And desperate.

I added rule to log ALL packets that are forwarded through.

wrote a tiny script to filter them out.

#!/usr/bin/env ruby

targets = ARGV[0..-1]
puts "targets: #{targets.inspect}"

data = {}
File.open('syslogemu.log') do |f|
     f.read.split("\n").each do |line|
         parts = line.split
         dst = parts[10].split('=')[1]
         if targets.size == 0 or targets.include?(dst)
             src = parts[9].split('=')[1]
             data[src] ||= 0
             data[src] += 1
         end
     end
end

data.to_a.sort_by { |e| e[0] }.each do |ip, conns|
     puts "#{ip} => #{conns}"
end

gw:/var/log/ulog# ./newconns.rb 87.248.113.14 206.190.60.37 68.180.206.184 
64.191.203.30
targets: ["87.248.113.14", "206.190.60.37", "68.180.206.184", "64.191.203.30"]
192.168.0.3 => 3

the 0.3 host is me trying to open digg.com

what the hell? No packets there and still it doesn't work? :((( I'm running out 
of ideas.
