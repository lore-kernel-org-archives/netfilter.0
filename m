From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Tue, 4 Jun 2002 00:34:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032334.g53NYgA30132@Networker.rockstone.co.uk>
References: <003c01c20b53$7941ed30$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003c01c20b53$7941ed30$6301a8c0@JJONES1>
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

On Tuesday 04 June 2002 12:07 am, John Jones wrote:

> Antony, thanks for your continued help.

My God, what a horrible setup you've got :-)

>      {NET}                {NET}
>     [ ADSL ]             [ SDSL ]
>      [FW A]               [FW B]
>      {LAN}                {DMZ}

Okay, so they're even less connected than I thought they were...

> FW A:
>   EXT IP:  209.139.199.253
>
> Everything here works.  I am on that network now.  We can browse the
> net, and all operations are normal.

Okay, where are you getting your name lookups from ?   Where are your 
internal clients being told to find their DNS server ?

> Now, I don't want to scare you, but this Firewall actually has 3 internal
> interfaces.  192.168.0.0/23, 192.168.10.0/24

That's okay - I can cope with three internal interfaces :-)

> and 10.0.0.2.  There -is- a physical network cable running from 10.0.0.2 to
> the DMZ hub/switch.  Thus, I can ping 10.0.0.10 from this firewall.

Okay.   This bothers me.   There's now an added complication of the routing 
tables on your internal machines, and the DNS server, which we need to make 
sure are really sending packets out to the Internet to talk to each other, 
and not just trying to hop across this cable when they reply to each other...

> FW B:
>   EXT IP:  66.38.133.113, .114, .115, .118, .119
>
> This is the firewall we are working to replace.  Now, in my script
> examples, I am using .120 because the current firewall works, the .120
> machine doesn't.  Thus, until everything on .120 works, I cannot replace
> the ipchains firewall at .113.  Does that make sense?

Yes, I see what you're doing - that's okay.

> Since the two firewalls have to communicate with each other over the
> Net, I thought that it would be most simple to configure the DMZ
> firewall (FW B above) as if all traffic that it has to deal with is
> Net-originated.  Thus, anything that hits the exterior interface (eth1)
> on that box should get port-forwarded to the DMZ Server (10.0.0.10).
> Right now, to keep it simple, I am working on the DNS.  Once I
> understand how THAT is set up correctly, I can worry about forwarding
> the multiple aliased addresses (.114, .115, etc) in on different high
> ports.

Okay - that bit should be pretty easy (grin).

On the DMZ firewall:

iptables -A PREROUTING -t nat -i eth1 -p tcp --dport 53 -j DNAT --to 10.0.0.10
iptables -A PREROUTING -t nat -i eth1 -p udp --dport 53 -j DNAT --to 10.0.0.10
iptables -A FORWARD -m state --state ESTABLISHED,RELATED - j ACCEPT
iptables -A FORWARD -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -p udp --dport 53 -j ACCEPT
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 66.38.133.120

> The LAN firewall, to my understanding (I could be wrong) is irrelevant
> here.  Since my LAN contacts the DMZ through the internet, we shouldn't
> have to worry about the LAN firewall at all.  Let me know if I am wrong.

Well, if you're trying to *redirect* all your internal accesses to DNS 
machines so they go to the machine on your DMZ, you need to do some DNAT 
routing on your LAN firewall to make sure they all point to your DMZ DNS.   
Maybe you're not trying to do that, though, and you've really configured the 
LAN clients so they know to send DNS requests to the external address of the 
DMZ firewall, in which case I wonder, how come everything's working okay 
right now ?   I repeat my earlier question - what address do your internal 
clients think they should use for a DNS server ?


If you put the above rules on your DMZ firewall, and then try from a machine 
on your internal network:

dig @66.38.133.120 samba.org

what happens ?

If it fails, go the the DNS machine itself (10.0.0.10) and try

dig samba.org

and see if it can get a reply from some external nameserver.



Okay - how close are we now ?


Antony.

