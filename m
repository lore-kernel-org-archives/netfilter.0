From: Carl Brewer <carl@vivitec.com.au>
Subject: Re: allowing traffic through an iptables ruleset to a machine on
 a  VM
Date: Fri, 25 Aug 2006 00:36:27 +1000
Message-ID: <44EDB96B.2060206@vivitec.com.au>
References: <44ED4E82.5050800@vivitec.com.au>
	<49311.193.173.147.3.1156410166.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49311.193.173.147.3.1156410166.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg wrote:
> On Thu, August 24, 2006 09:00, Carl Brewer wrote:
> 
>> Hello,
>> I'm used to IPFilter, not much experience with iptables, so please
>> bear with me.
>>
>> I have a Redhat ES server, (RHES 4), and it has a VM on it with a host on
>> the VM.  I need to allow traffic to & from the VM host with no restrictions,
>> but filter traffic to the main host. The VM is running cPanel (yeah ... I
>> know ...) on RHES 4, and it can look after itself, but I need to protect the
>> main host.
>>
>> It's complicated a little by needing to do some NAT to
>> get the VM host to be able to see the outside world.
>>
>> The iptables ruleset is below (this is just a modified RH default
>> ruleset).  I don't really understand enough about how IPtables does its naming
>> of things to really get what the RH-Firewall-1-INPUT thing means.
> 
> This is typical RH. The policy of the INPUT chain is set to ACCEPT, so
> basically, when something is not explicitly dropped or rejected, everything is
> accepted.

Yep, or, it does the last match?  Kinda like IPF and everything being

<action> quick <rule>
and the last rule being drop or reject?

> The first (and only) rule in the INPUT chain says:
> -A INPUT -j RH-Firewall-1-INPUT
> 
> So, it does no matching of any kind and just passes everything to the user
> defined chain RH-Firewall-1-INPUT, which does the actual matching.
> 
>> Is there some way I can tell it to "just let everything to and from
>> [ip.address] through" ?
> 
> $ipt -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $ipt -A INPUT -m state --state NEW -s <source_ip> -j ACCEPT
> 
>> On IPF I know how to do it, but all the netfilter howto's I've found
>> deal with either just very simple case of IPTables looking after the host it's
>> on, or seem overly complex what I'm trying to do.
> 
> Did you take a look at Oskar Andreason's IPTables Tutorial?
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html

I'll have a look, thankyou.

>> My ruleset below doesn't seem to let DNS zone transfers, FTP
>> etc out from the VM box, which we need to be able to do so it can manage
>> itself.
>>
>>
>> *filter
>> :INPUT ACCEPT [0:0]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [0:0]
>> :RH-Firewall-1-INPUT - [0:0]
>> -A INPUT -j RH-Firewall-1-INPUT
>> -A FORWARD -j RH-Firewall-1-INPUT
> 
> Hmm. See below.
> 
>> -A RH-Firewall-1-INPUT -i lo -j ACCEPT
>> # I don't think we trust everying inbound on eth0 eh? :)
>> #-A RH-Firewall-1-INPUT -i eth0 -j ACCEPT
>> -A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
>> -A RH-Firewall-1-INPUT -p 50 -j ACCEPT
>> -A RH-Firewall-1-INPUT -p 51 -j ACCEPT
>> -A RH-Firewall-1-INPUT -p 53 -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 10080
>> -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 9080
>> -j ACCEPT
>> # Tor (private internet access for David)
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 9001
>> -j ACCEPT
>> # ice cPanel
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2083
>> -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2087
>> -j ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2089
>> -j LOG
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 2089
>> -j ACCEPT
>> # ssh etc ...
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j
>> ACCEPT
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 110 -j
>> ACCEPT
>> # this only lets passive FTP through
>> -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
>> ACCEPT
>>
>>
>> # DNS from vmnet8 VM host
>> -A RH-Firewall-1-INPUT -m state --state NEW  -s 72.3.205.160/32 -m udp
>> -p udp --dport 53 -j ACCEPT
> 
> So here you accept port 53/udp. This should allow dns queries.

Yep.  Should ...
Isn't ...




> 
>> -A RH-Firewall-1-INPUT -j LOG
>> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
>> COMMIT
>>
>>
>> the routing table on the main server :
>>
>> /sbin/ip route
>> 72.3.205.160 via 192.168.239.2 dev vmnet1
>> 72.3.230.0/26 dev eth0  proto kernel  scope link  src 72.3.230.30
>> 192.168.0.0/24 dev vmnet8  proto kernel  scope link  src 192.168.0.1
>> 192.168.239.0/24 dev vmnet1  proto kernel  scope link  src 192.168.239.1
>> 10.241.0.0/19 dev eth1  proto kernel  scope link  src 10.241.6.177
>> 169.254.0.0/16 dev eth1  scope link
>> 10.251.0.0/16 via 10.241.0.1 dev eth1
>> default via 72.3.230.1 dev eth0
>>
>> I have conntrack enabled :
>> in /etc/sysconfig/iptables-config :
>>
>> IPTABLES_MODULES="ip_conntrack_ftp"
>>
>>
>> And we can FTP into the main server accordingly.
>>
>>
>> The logs show traffic like this :
>>
>>
>> Aug 24 16:55:36 blah kernel: IN=eth0 OUT=vmnet1 SRC=203.89.199.155
>> DST=72.3.205.160 LEN=63 TOS=0x00 PREC=0x00 TTL=48 ID=14154 DF PROTO=UDP
>> SPT=41932 DPT=53 LEN=43
>>
>>
>> Where 72.3.205.160 is the external IP address of the VM host that
>> we're mapping to its RFC1918 address.  I think the above means it was dropped?
> 
> The only rule I see that has a LOG target is:
> -A RH-Firewall-1-INPUT -j LOG
> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited COMMIT
> So this packet would have been rejected, but not dropped (use -j DROP for that).

Ok, when I try this remotely :

dig @ice.vivitec.com www.sun.com

I get this logged :

Aug 25 00:32:14 nitro kernel: IN=eth0 OUT=vmnet1
SRC=203.6.241.134 DST=72.3.205.160 LEN=57
TOS=0x00 PREC=0x00 TTL=50 ID=32620 PROTO=UDP
SPT=59668 DPT=53 LEN=37

Which, if I'm not mistaken, means it's being dropped?  This
is consistant with this result :

dig @ice.vivitec.com www.sun.com

; <<>> DiG 9.3.0 <<>> @ice.vivitec.com www.sun.com
;; global options:  printcmd
;; connection timed out; no servers could be reached

I would have thought that the DNS rule above would allow that
traffic?

>> Thanks for any suggestions!  It's kinda urgent, I need to
>> get it going pronto, but the only way I've been able to get the VM box to be
>> able to connect out is if I've disabled the REJECT rule (suboptimal, you might
>> say!)
> 
> Yes, because then everything is accepted according to this ruleset (there's
> only 1 REJECT rule, no DROP, and it's at the end of your ruleset).
> 
> You say that currently you are using NAT to have network connectivity on the
> VM.  When using NAT, packets travel the FORWARD chain, *NOT* (never) the INPUT
> chain, so any rules should be put there.

In this case, that's all in the one 'chain', then?

> The INPUT and FORWARD chain are both linked to RH-Firewall-1-INPUT so they
> share the same rules. When something is logged, you won't know whether it came
> from the INPUT or FORWARD chain.
> I think you'd better have separate rules for each chain, not combining them
> into 1 user defined chain. You could put all rules you need right into the
> INPUT or FORWARD chain, or create a separate RH-Firewall-1-FORWARD and link
> the FORWARD chain to that one.
> Also, modify the LOG rule in each chain so it tells you what chain is logging.
> It would look something like this:
> ... -j LOG --log-prefix "<some_text_here>"
> 
> What VM software are you using and how is networking for the VM's configured?
> When using VMware, I thought you'd be able to configure it in such way that
> you don't need NAT.

We're using VMware, because the IP address we have for the VM is a /32
we have to do NAT so that the VM can have a default route. It's done
through vmware.  I don't have the details handy though.

>> I need a rule that will let DNS queries and zone transfers in and out of the
>> VM, but am stumped as to how to do it.  The box is far away (different
>> country!) and I can't just fiddle with it for risk of locking myself out, so
>> I seek the advice of the list.
> 
> See above. If this about allowing DNS queries and zone transfers, allow both
> ports 53/udp and 53/tcp.
> 
> -A RH-Firewall-1-INPUT -m state --state NEW  -s 72.3.205.160/32 -m tcp
> -p tcp --dport 53 -j ACCEPT

Ja, I'll add that and see if it lets zone transfers through, then I'll
try and work out why the FTP (I think it's FTP anyway ... cPanel is
a little lacking in doco ...) isn't getting through.


Thanks Rob,

Carl


-- 
=======================
Vivitec Pty. Ltd.
Suite 6, 51-55 City Rd.
Southbank, 3006.
Ph. +61 3 8626 5626
Fax +61 3 9682 1000
=======================

