From: Walther@gehag-dsk.de
Subject: Re: FreeS/WAN + static NAT + 2 machines
Date: Mon, 23 Sep 2002 15:22:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF03FE8E69.B9569B38-ONC1256C3D.0046EECA-C1256C3D.0049776F@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

>On Monday 23 September 2002 10:33 am, Walther@gehag-dsk.de wrote:

>> my setup is this one:
>>
>> <LAN>---<firewall>---<freeswan gateway>---<firewall with static
>> nat>--<cisco(only routing)>---<internet>

>Interesting.   Why do you have two separate firewalls, plus a FreeS/WAN 
>gateway ?   I would have thought:

I don't really like collapsed firewalls. That's why I installed two 
firewalls. The second is, there are some other machines in the DMZ such as 
a proxy.

>a) one firewall would be sufficient (obviously the one inside the IPsec 
>gateway, so it can filter unencrypted traffic)

>b) you should be able to run the firewalling, the NAT, and IPsec all on a 

>single machine (what speed is your Internet link ?)

i'm sorry, but thats no option, coz the machines aren't powerful enough to 
do both.

>c) if necessary, you could put the IPsec machine on a DMZ interface of 
the 
>firewall to keep its traffic separate from the internal LAN

this is what I want to do

>Anyway, given the setup you have:

>> I want to nat incoming connections for the freeswan gateway. but up to 
now
>> I wasn't able to do this.

>I assume you are running IPsec in tunnel mode (network at both ends, 
Security 
>Gateways encrypting traffic and acting as routers, not endpoints), rather 

>than transport mode (one or both Security Gateways is an endpoint of the 
data 
>communication).

on the one side there is a roadworrior and on the other side there is our 
internal lan.

>Provided you are using tunnel mode, you can NAT IPsec traffic.   The ESP 
>protocol works through NAT.

>If you are using transport mode, you cannot NAT IPsec traffic.   The AH 
>protocol breaks under NAT.

>> I tried the following:
>>
>> <--snip-->
>>
>> iptables -t nat -A POSTROUTING -o $EXT -s <internal_ip_for_freeswan> -j
>> SNAT --to <external_ip_for_freeswan>
>> iptables -t nat -A PREROUTING -i $EXT -d <external_ip_for_freeswan> -j
>> DNAT --to <internal_ip_for_freeswan>
>> iptables -A FORWARD -p 50 -d <internal_ip_for_freeswan> -j ACCEPT
>> iptables -A FORWARD -p 51 -d <internal_ip_for_freeswan> -j ACCEPT
>> iptables -A FORWARD -p udp --dport 500 -d <internal_ip_for_freeswan> -j
>> ACCEPT

>Those rules are okay, but do you also have FORWARDing rules to allow data 

>*out* from the FreeS/WAN machine as well as into it:

i'm sorry, i forgot to write this down; yes there ar also forwarding rules 
the other way around (from inside to outside).

>iptables -A FORWARD -p udp --dport 500 -s <internal_ip_for_freeswan> -j 
ACCEPT

>etc. ?

>(By the way, you could tighten that rule slightly because you know the 
source 
>port is 500 as well as the destination port, so specify both --sport 500 
and 
>--dport 500 to make sure it really is IKE traffic).

I will check this out, thx.

>> but this won't work for me. maybe somebody of you can help me with 
fixing
>> this issue.

>The other thing which might be relevant is your ipsec.conf files on the 
two 
>Security Gateways: the standard FreeS/WAN instructions tell you to put 
the 
>same configuration file on both ends, however when you are using NAT in 
>between the two Gateways, the rule becomes:

>the configuration file on each IPsec machine must contain the addresses 
for 
>the local and remote machines, as known to the local machine.

you mean, on both sides the external IP for the freeswan-gateway???

>Thus the machine in your diagram above would have its internal IP address 
in 
>its own configuration file, but the IPsec machine at the other end would 
have 
>this machine's external IP address in its configuration file.

>Does that help?

>What do you see in your /var/log/messages when you try to start FreeS/WAN 

>running ?

in my test-config without firewall, i get:

ISAKMP SA Established, Respond to MR3 and I get IPSec SA Established. But 
when I try to use the rules above and change the config files from 
freeswan (or leave it as before) i don't get any of these messages.


>Antony.


>By the way, I have a really complicated diagram on a whiteboard which 
shows 
>how packets travel through the various chains / tables of netfilter on a 
>machine also running FreeS/WAN - if you ever consider setting up a single 

>machine to do your filtering, NAT and IPsec I'll figure out a way to get 
you 
>a copy so you can understand what rules you need and what addresses to 
expect 
>where.....

this would be very nice. i think this would also be very helpful. thx

>-- 

>Behind the counter a boy with a shaven head stared vacantly into space,
>a dozen spikes of microsoft protruding from the socket behind his ear.

> - William Gibson, Neuromancer (1984)

THX

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04

