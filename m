From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: FW: Opening connection
Date: Wed, 30 Oct 2002 17:31:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC0097E.1020102@prosyst.com>
Mime-Version: 1.0
Content-Type: multipart/related;
 boundary="------------000302090403060906010409"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--------------000302090403060906010409
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

   If I understood your wish clearly you have the following situation

   1. Gateway connected to the Internet as well as to your LAN
       - external interface eth0 with IP 1.2.3.4
       - internal interface eth1 with iP 9.9.9.1
   2. Mail server running inside your LAN on IP 9.9.9.2 using the above 
machine as Internet gateway
   3. Web server again on your local LAN on IP 9.9.9.3 and the same as 
for your mail server
   (Note) All the values are example ones.

   The firewall rules which you'll need in order both server to be 
visible from Internet could look like:

   iptables -t nat -A PREROUTING -p tcp -i eth0 -d 1.2.3.4 --dport 80 -j 
DNAT --to-destination 9.9.9.3
   iptables -t nat -A PREROUTING -p tcp -i eth0 -d 1.2.3.4 --dport 443 
-j DNAT --to-destination 9.9.9.3

   iptables -t nat -A PREROUTING -p tcp -i eth0 -d 1.2.3.4 --dport 25 -j 
DNAT --to-destination 9.9.9.2
   iptables -t nat -A PREROUTING -p tcp -i eth0 -d 1.2.3.4 --dport 110 
-j DNAT --to-destination 9.9.9.2
     (Note) For the external world it'll look like both servers are 
running on your Gateway.
     And of course using this configuration you don't need to change the 
routing table. But at least the DNS entries for the mail and web server 
must point to the external IP of your Gateway.

   One addition - use for example the following rule if you want your 
LAN to be able to reach Internet via the above Gateway:
     #Enable IP forwarding
   echo 1 > /proc/sys/net/ipv4/ip_forward
   iptables -t nat -A POSTROUTING -o eth0 -s 9.9.9.0/24 -j SNAT 
--to-source 1.2.3.4
       where 9.9.9.0 is your LAN and 24 is your LAN's netmask.

Regards :)

MValentin@imsidc.com wrote:

>  
>
>> Please if anybody can help me. My first Linux 7.2 firewall. How do I 
>> setup
>> a connection using NAT for a web and mail server in the LAN. Also, Do I
>> have to create entries for the routing table?
>>   
>
>
>
>
>  
>

--------------000302090403060906010409--


