From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 16:07:46 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003c01c20b53$7941ed30$6301a8c0@JJONES1>
References: <200206032238.g53McUA26957@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206032238.g53McUA26957@Networker.rockstone.co.uk>
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
To: 'Iptables' <netfilter@lists.samba.org>

Antony, thanks for your continued help.

> No, I didn't think it would solve the whole problem, but it's 
> a step closer...
> 
> > We have two firewalls, one for the LAN and one for the DMZ.
> 
> Whoa !!!   That's significant !   There's all sorts of 
> complicated routing 
> issues which come in now :-)
> 
> Let's see if I've got this understood now:
> 
> You have some sort of router connected to the Internet; 
> there's a hub or 
> switch on the inside of that router, and you have two 
> firewalls both with 
> publicly-routable external addresses on them connected to that hub.

     {NET}                {NET}
       |                    |
    [ ADSL ]             [ SDSL ]
       |                    |
     [FW A]               [FW B]
       |                    |
     {LAN}                {DMZ}


FW A:
  EXT IP:  209.139.199.253
  
Everything here works.  I am on that network now.  We can browse the
net, and all operations are normal.  Now, I don't want to scare you, but
this Firewall actually has 3 internal interfaces.  192.168.0.0/23,
192.168.10.0/24 and 10.0.0.2.  There -is- a physical network cable
running from 10.0.0.2 to the DMZ hub/switch.  Thus, I can ping 10.0.0.10
from this firewall.  However, I am wanting to phase this connection out.
As I mentioned, I am preparing for the day the President walks in and
says "We are seperating the DMZ so our customers have much faster access
speeds.  I want you to co-locate it somewhere.  Tomorrow."

FW B:
  EXT IP:  66.38.133.113, .114, .115, .118, .119

This is the firewall we are working to replace.  Now, in my script
examples, I am using .120 because the current firewall works, the .120
machine doesn't.  Thus, until everything on .120 works, I cannot replace
the ipchains firewall at .113.  Does that make sense?  This is intended
to be an upgrade of hardware and software in place, but until this
works, I am not about to take down our corporate website, mail server
and FTP sites.  :)  Right now, 10.0.0.10 is the only server behind this
firewall and both this firewall and the DMZ server (ftp,mail,web) have
multiple interface aliases.  This is structured for expansion later.
Thus, a website configured at 66.38.133.115 (which is subsequently
port-forwarded to 10.0.0.15) can be seperated to its own machine much
more easily during the rapid expansion that this company is seeing (we
have doubled in size in 6 months).

But, again, I want to keep the problem simple so people aren't going
nuts trying to help me... Or worse, ignore my pleas because of the
apparently complexity of the issue.  Thus, I just want to forward DNS
requests on the external IP to the DMZ server and get a response at the
client.  This isn't working.
 
> Both firewalls have exactly two interfaces.
> 
> One firewall has a LAN on its internal interface; the other 
> firewall has a 
> DMZ, with a DNS server on its internal interface (the address 
> of this DNS 
> server is 10.0.0.10)
> 
> You are trying to redirect all DNS requests from machines on 
> the LAN (ie 
> inside one firewall) to the DNS server on your DMZ (ie inside 
> the other 
> firewall).
> 
> Is that correct ?

Since the two firewalls have to communicate with each other over the
Net, I thought that it would be most simple to configure the DMZ
firewall (FW B above) as if all traffic that it has to deal with is
Net-originated.  Thus, anything that hits the exterior interface (eth1)
on that box should get port-forwarded to the DMZ Server (10.0.0.10).
Right now, to keep it simple, I am working on the DNS.  Once I
understand how THAT is set up correctly, I can worry about forwarding
the multiple aliased addresses (.114, .115, etc) in on different high
ports.

Now, don't laugh.  I inherited this network, and I know it has issues.
I just don't have the manpower or time right now to completely
restructure it fast enough to make the changes transparent to the users
of the network and our clients.  :(
 
> If so, then I have got confused with the last ruleset you 
> posted - was that 
> for the LAN firewall or the DMZ firewall - they're both 
> important, and they 
> need to be different, so I think now you've said you have 
> two, it's important 
> to be clear which one we're discussing at a given time.

The LAN firewall, to my understanding (I could be wrong) is irrelevant
here.  Since my LAN contacts the DMZ through the internet, we shouldn't
have to worry about the LAN firewall at all.  Let me know if I am wrong.
 
> Briefly, you need to do this on your LAN firewall:
> 
> PREROUTING translate all TCP and UDP packets from the 
> internal interface 
> destined for port 53 to the external address of your DMZ 
> firewall FORWARD packets to TCP and UDP ports 53 FORWARD all 
> ESTABLISHED and RELATED packets
> 
> Plus anything else you want your LAN firewall to do...

All done.  :)  Works great.  Maybe it was serendipity that I got THAT to
work, given my current problems understanding what is going wrong?

> Then, on your DMZ firewall:
> 
> PREROUTING translate all TCP and UDP packets addressed to the 
> firewall itself 
> for port 53, to 10.0.0.10

iptables -t nat -I PREROUTING 1 -i eth1 -p tcp --dport 53 -j DNAT --to
10.0.0.10
iptables -t nat -I PREROUTING 1 -i eth1 -p udp --dport 53 -j DNAT --to
10.0.0.10

> FORWARD packets to TCP and UDP ports 53

iptables -A FORWARD -i eth0 -j ACCEPT

> FORWARD all ESTABLISHED and RELATED packets

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward

> POSTROUTING translate all outgoing packets to have a source 

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 66.38.133.120

> address of the 
> DMZ firewall

Again, I do not see why this is not working.  I -thought- I understood
what was needed, but I have seen different ways to skin this cat (to use
a slang phrase for those not native English speakers) which, after
hammering on this for 3 days, has just ended up burning my brain and
confusing me.

I mentioned before that I have our LAN firewall set up so that people
can get port-forwarded to their work machines by ssh'ing to a high port
on our LAN firewall.  THAT works great, and I assumed that this would be
an application of the same rules, which may have been what confused you
earlier.  I apologize.

I tried to keep the problem simple.  But, as you can see, this is
hellish.


John





