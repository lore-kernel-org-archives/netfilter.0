From: "Stuart Lamble" <stu@gateway10.homeip.net>
Subject: RE: DNAT not working
Date: Sat, 20 Mar 2004 19:47:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c40ea3$5da32e90$0464a8c0@stu>
References: <200403182050.33327.Antony@Soft-Solutions.co.uk>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403182050.33327.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: 'Antony Stone' <Antony@Soft-Solutions.co.uk>

Hi Antony

Output from iptables -L -t nat
--------------------------------------------------------
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  anywhere             xxx.xxx.xxx.xxx dpt:msg-icp
to:192.168.100.6:29 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  all  --  192.168.100.0/28     anywhere           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination  
------------------------------------------------------------

Output of iptables -L
--------------------------------------------------------------
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     all  --  anywhere             anywhere           
ACCEPT     icmp --  anywhere             anywhere           
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:smtp

ACCEPT     udp  --  anywhere             anywhere           udp
spt:domain 
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:http

DROP       tcp  --  anywhere             anywhere           tcp dpt:ftp 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp

ACCEPT     tcp  --  anywhere             anywhere           tcp
dpt:msg-icp 
ACCEPT     tcp  --  anywhere             anywhere           tcp
multiport ports msg-icp 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http

ACCEPT     tcp  --  anywhere             anywhere           tcp
dpt:https 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ndmp

ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED 

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere           tcp
multiport ports msg-icp 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

---------------------------------------------------------------

The port in question is 29, ssh modified for 29 as the gateway with the
dsl connected has ssh running on port 22, so makes sense to use another
port, else I would always get the gateway ssh responding.

Note that I am using webmin firewall to configure the iptables.

I do get the counters incrementing on the prerouting rule.
From the gateway machine I am able to ssh -p 29 192.168.100.6
The gateway machine has two network cards, internal eth 1 =
192.168.100.1 and external eth0 = $IP.
The virtual ppp0 comes up with the Public IP.

Thanks Stuart







-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Thursday, March 18, 2004 10:51 PM
To: netfilter@lists.netfilter.org
Subject: Re: DNAT not working


On Thursday 18 March 2004 8:26 pm, Stuart Lamble wrote:

> Hello netfilter lists

Hello Stuart.

> iptables -t nat -A PREROUTING -i ppp0 -p tcp -d $FW-EXT-IP --dport 22 
> -j DNAT --to 192.168.100.6:22
>
> Simply put I want to allow ssh from the internet to a server on my 
> LAN, 192.168.100.6 My FORWARD rule is default accept.

Ugh :(   I trust you are going to change that very soon :)

> I understand that a packet comes into the firewall on an interface and

> then gets PREROUTED as above the gets passed to FORWARD = accept then 
> to the destination???

Yes, that is the correct mechanism.

> Why is it not working? Do i need to do any special kernel, modprobe 
> things?

No, the above rule, combined with a (gulp) default ACCEPT policy on
FORWARD, 
should do what you want.

I suggest the following:

1. Post the remainder of your ruleset so we can see what else may be
having an 
effect.

2. Tell us how you are testing the rule.

3. Look at the output of "iptables -L -t nat -nvx" - do the packet &
byte 
counters show that any packets are matching the above rule?

4. Put a LOGging rule in your FORWARD chain so you can see what packets
appear 
to be going through the firewall (I suggest two rules, one for packets
to TCP 
port 22, one for packets from TCP port 22, or alternatively two rules
for 
packets to / from 192.168.100.6, so that you don't get so much logging
output 
that you can't see what's going on).

5. Tell us about anything else which *does* work through your firewall
(eg: 
can you browse the Internet from an internal client? can you send &
receive 
email? can you resolve hostnames?)

Hope something here helps,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the
list;
                                                           please don't
CC me.



---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.631 / Virus Database: 404 - Release Date: 3/17/2004
 

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.634 / Virus Database: 406 - Release Date: 3/18/2004
 


