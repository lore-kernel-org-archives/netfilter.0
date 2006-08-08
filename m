From: Dan Ferris <dan@usrsbin.com>
Subject: Re: 1:1 NAT Help
Date: Tue, 08 Aug 2006 06:37:59 -0600
Message-ID: <44D885A7.6040403@usrsbin.com>
References: <44D78CC7.5020607@usrsbin.com><02BB8A4AC86C564C89C7F14CF98CE0C40127FB@knowledge.wizdom.nu>	<44D8803B.6060703@usrsbin.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127FC@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127FC@knowledge.wizdom.nu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Forwarding is on in /etc/sysctl.conf

As far as I know the routing is correct.  10.2.253.21 lives off of eth1, 
and eth1 has a route for 10.2.0.0/255.255.0.0 (yes it sucks, I didn't 
set up the subnets). 

tcpdump shows traffic coming into both of the interfaces, which is why 
this problem is so frustrating.  Oh yes, SNAT works fine.  We can set up 
a ping from the box behind the firewall to ping the Internet gateway, 
and the ping will go through fine.  We can see the replies to 
204.184.20.221. :(

Dan

Sietse van Zanen wrote:
> Then, is forwarding alllowed?
> cat 1 > /proc/sys/net/ipv4/ip_forward
>  
> And there is a correct route to 10.2.253.21?
>
>  
> If both answer to yes, what do you see when you tcpdump on your internal interface on host 10.2.253.21 and try to connect to 204.184.20.221 from the Internet?
>  
> And what do you see when you tcpdump on your external interface for 204.184.20.221, is traffic reaching your firewall?
>  
> -Sietse
>
> ________________________________
>
> From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
> Sent: Tue 08-Aug-06 14:14
> To: netfilter@lists.netfilter.org
> Subject: Re: 1:1 NAT Help
>
>
>
> Yes, because I cleared all the rules and set everything to accept before
> testing.
>
> Dan
>
> Sietse van Zanen wrote:
>   
>> Are you sure, you also allow the connection in the FORWARD chain of the filter table?
>>
>> iptables -i eth2 -d 10.2.253.21 -j ACCEPT
>>
>> -Sietse
>>
>> ________________________________
>>
>> From: netfilter-bounces@lists.netfilter.org on behalf of Dan Ferris
>> Sent: Mon 07-Aug-06 20:56
>> To: netfilter@lists.netfilter.org
>> Subject: 1:1 NAT Help
>>
>>
>>
>> Dear List,
>>
>> I have search Google, and the list archives back to 2003 and have found
>> little information about this particular problem.
>>
>> First I present to you two very simplified rules.
>>
>> iptables -A PREROUTING -i eth2 -d 204.184.20.221 -j DNAT --to 10.2.253.21
>>
>> and
>>
>> iptables -A POSTROUTING -o eth2 -s 10.2.253.21 -j SNAT --to 204.184.20.221
>>
>> Having never really delt with 1:1 NAT before, I thought this would "just
>> work".  However, it does not work.  The SNAT rule works fine.  The DNAT
>> rule does not work at all.  I don't even see packets hitting it.
>>
>> A few other pieces of information:
>>
>> 1.  Proxy arp does not seem to be a problem.  When I SSH to the external
>> IP, I can see the ethernet frames coming into the ethernet interface.
>>
>> 2.  I have tried doing: ip addr add 204.184.20.221 dev eth2 and it still
>> won't work.
>>
>> We have an old POS box running Debian with Shorewall and kernel 2.4 that
>> works perfectly with the 1:1 NAT rules.  However, the friend I am
>> helping does not want to use Shorewall, as she wishes to learn iptables
>> the old fashioned way.  The only difference between the old Debian
>> firewall and the new one is the the new one is running CentOS and the
>> 2.6 kernel.
>> The old firewall that works has proxy arp turned off and rp_filter
>> turned on.  The new firewall has proxy arp turned off and rp_filter
>> turned on.
>>
>> I'm really lost and I used to think I was decent at iptables.  So if
>> anybody can help it would be appreciated.
>>
>> Thank you!
>>
>> Dan
>>
>>
>>
>>
>>
>>  
>>     
>
> --
> What do you call a guy with no legs who is waterskiing?
>
>
> Skip.
>
>
>
>
>
>
>   

-- 
What do you call a guy with no legs who is waterskiing?


Skip.


