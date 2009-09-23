From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: Re: NAT overlaps with ports
Date: Wed, 23 Sep 2009 14:14:49 +0300
Message-ID: <4ABA0329.70102@edu.physics.uoc.gr>
References: <4AB9EF8F.4020307@edu.physics.uoc.gr> <4AB9FC72.9000906@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AB9FC72.9000906@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 23/09/09 13:46, Pascal Hambourg wrote:
> This IP range is private, not public.
> If you made it up, please use the 192.0.2.0/24 range reserved for
> examples and documentation instead.
>    
Yes I made it up.
>> 10.0.0.0/24 is my private IP range (eth1)
>> 192.168.1.1 public IP of server
>> 10.0.0.1 private IP of server
>>
>> I'd like to add the following rules in the nat table:
>>
>> [1] -A PREROUTING -i eth0 -d 192.168.1.1 -p tcp --dport 8080 -j DNAT
>> --to-destination 10.0.0.1:8080
>> [2] -A POSTROUTING -o eth0 -s 10.0.0.1 -p tcp --sport 8080 -j SNAT
>> --to-source 192.168.1.1:8080
>> [3] -A POSTROUTING -o eth0 -s 10.0.0.0/24 --to-source
>> 192.168.1.1-192.168.1.10
>>      
> Rule [2] is pointless. Packets with source port 8080 are obviously
> replies, and Netfilter NAT implicitly takes care of reply packets
> packets. Actually, the 'nat' chains don't even see reply packets.
>    
You're right, I will remove it.
>> According to http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6.html
>> iptables is clever enough to avoid overlaps and clashes.
>> Are we sure that there isn't any chance to map a random packet (not from
>> the server)
>> to 192.168.1.1:8080 in rule [3]?
>>      
> No. That could happen as long as it does not create a collision with an
> existing mapping. Why do you worry about it ?
> The important point is that netfilter avoids collisions between existing
> NAT mappings. Rules do not create mappings by themselves, a mapping is
> created only for each new connection created by a packet.
>    

What I'm worried of is than a random connection could be created which uses
the mapping of port 8080 of 192.168.1.1 and then the internal server 
would not be available.
But I guess this is not a problem since a connection has 4 parameters 
src/dst ip/port.

thanks for answering

Giannis


