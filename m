From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 16:55:52 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <004501c20b5a$31559650$6301a8c0@JJONES1>
References: <200206032334.g53NYgA30132@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206032334.g53NYgA30132@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Iptables <netfilter@lists.samba.org>

> > Antony, thanks for your continued help.
> 
> My God, what a horrible setup you've got :-)

Tell me about it.  WOE IS ME!!  ;)
 
> Okay, where are you getting your name lookups from ?   Where are your 
> internal clients being told to find their DNS server ?

The DHCP server serves up 66.38.133.113 as the IP of the nameservers.
And, everything works fine.
 
> > and 10.0.0.2.  There -is- a physical network cable running from 
> > 10.0.0.2 to the DMZ hub/switch.  Thus, I can ping 10.0.0.10 
> from this 
> > firewall.
> 
> Okay.   This bothers me.   There's now an added complication 
> of the routing 
> tables on your internal machines, and the DNS server, which 
> we need to make 
> sure are really sending packets out to the Internet to talk 
> to each other, 
> and not just trying to hop across this cable when they reply 
> to each other...

Shouldn't be.  I said I can ping it from the Firewall, not from the
networks behind it.

However, if it makes a difference (and we might eventually want to cover
that base?), I can post the routing tables from each machine.  I am
sure, since this is a patchwork network, that there are lots of issues
that would make any real network admin tear their hair out. ;)

> On the DMZ firewall:
> 
> iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 53 -j 
> DNAT --to 10.0.0.10 iptables -A PREROUTING -t nat -i eth1 -p 
> udp --dport 53 -j DNAT --to 10.0.0.10 iptables -A FORWARD -m 
> state --state ESTABLISHED,RELATED - j ACCEPT iptables -A 
> FORWARD -p tcp --dport 53 -j ACCEPT iptables -A FORWARD -p 
> udp --dport 53 -j ACCEPT iptables -A POSTROUTING -t nat -o 
> eth1 -j SNAT --to 66.38.133.120
> 
> > The LAN firewall, to my understanding (I could be wrong) is 
> irrelevant 
> > here.  Since my LAN contacts the DMZ through the internet, we 
> > shouldn't have to worry about the LAN firewall at all.  Let 
> me know if 
> > I am wrong.
> 
> Well, if you're trying to *redirect* all your internal 
> accesses to DNS 
> machines so they go to the machine on your DMZ, you need to 
> do some DNAT 
> routing on your LAN firewall to make sure they all point to 
> your DMZ DNS.   

No, that is not what's intended.  I just want to query 66.38.133.120 as
if it were any other nameserver on the net.  No redirects needed.

> Maybe you're not trying to do that, though, and you've really 
> configured the 
> LAN clients so they know to send DNS requests to the external 
> address of the 
> DMZ firewall, in which case I wonder, how come everything's 
> working okay 
> right now ?   I repeat my earlier question - what address do 
> your internal 
> clients think they should use for a DNS server ?

Now you've got it.  :)  Everything -does- work okay right now, because
the .113 server is running IPCHAINS and IPMASQADM with portforwarding.
What I am trying to do is replace that machine with a new hardware box
running IPTABLES.  Here, I run into issues.

I started out by converting all of the old IPCHAINS rules into IPTABLES
format.  Ran into trouble.  Pared down the ruleset to minimize my own
confusion and maybe spot the problem, so I picked the easiest 'problem'
to deal with.  DNS.  Here we are, and I still don't see the problem.  :(

> If you put the above rules on your DMZ firewall, and then try 
> from a machine 
> on your internal network:

Your rules, copied and pasted, and a glance at -nL -v for both FILTER
and NAT tables:  

Chain INPUT (policy ACCEPT 25 packets, 2216 bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:53 
    0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED 

Chain OUTPUT (policy ACCEPT 25 packets, 2984 bytes)
 pkts bytes target     prot opt in     out     source
destination         

----------------------- NAT TABLES ---------------------------

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:53 to:10.0.0.10 
    0     0 DNAT       udp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 to:10.0.0.10 

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
    0     0 SNAT       all  --  *      eth1    0.0.0.0/0
0.0.0.0/0          to:66.38.133.120 

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination    


> 
> dig @66.38.133.120 samba.org
> 
> what happens ?

I am working off of a Windows box, so the equivalent output:



C:\>dig @66.28.133.120 samba.org
'dig' is not recognized as an internal or external command,
operable program or batch file.

C:\>nslookup
Default Server:  merlintechnologies.com
Address:  66.38.133.113

> samba.org
Server:  merlintechnologies.com
Address:  66.38.133.113

Non-authoritative answer:
Name:    samba.org
Address:  198.186.203.85

> server 66.38.133.120
Default Server:  h66-38-133-120.gtconnect.net
Address:  66.38.133.120

> samba.org
Server:  h66-38-133-120.gtconnect.net
Address:  66.38.133.120

DNS request timed out.
    timeout was 2 seconds.
DNS request timed out.
    timeout was 2 seconds.
*** Request to h66-38-133-120.gtconnect.net timed-out
>



 
> If it fails, go the the DNS machine itself (10.0.0.10) and try
> 
> dig samba.org
> 
> and see if it can get a reply from some external nameserver.

Yes, it works fine.  Remember, this DNS server has been serving our
network for a year or two.  Through the current IPCHAINS rules (and the
current, but outdated, .113 firewall) everything is fine.  It is the
upgrade to IPTABLES that seems to be failing.
 
> Okay - how close are we now ?
> 
> 
> Antony.
> 
> 


