From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help needed understanding what I am doing wrong.
Date: Mon, 3 Jun 2002 23:38:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206032238.g53McUA26957@Networker.rockstone.co.uk>
References: <002b01c20b49$cbb0e080$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002b01c20b49$cbb0e080$6301a8c0@JJONES1>
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

On Monday 03 June 2002 10:58 pm, John Jones wrote:

> > (By the way, you should change that --sport in the last rule
> > to --dport.)
>
> Okay, sorry I typoed.  I fixed the typo, however, and that doesn't solve
> it.

No, I didn't think it would solve the whole problem, but it's a step closer...

> We have two firewalls, one for the LAN and one for the DMZ. 

Whoa !!!   That's significant !   There's all sorts of complicated routing 
issues which come in now :-)

Let's see if I've got this understood now:

You have some sort of router connected to the Internet; there's a hub or 
switch on the inside of that router, and you have two firewalls both with 
publicly-routable external addresses on them connected to that hub.

Both firewalls have exactly two interfaces.

One firewall has a LAN on its internal interface; the other firewall has a 
DMZ, with a DNS server on its internal interface (the address of this DNS 
server is 10.0.0.10)

You are trying to redirect all DNS requests from machines on the LAN (ie 
inside one firewall) to the DNS server on your DMZ (ie inside the other 
firewall).

Is that correct ?

If so, then I have got confused with the last ruleset you posted - was that 
for the LAN firewall or the DMZ firewall - they're both important, and they 
need to be different, so I think now you've said you have two, it's important 
to be clear which one we're discussing at a given time.

Briefly, you need to do this on your LAN firewall:

PREROUTING translate all TCP and UDP packets from the internal interface 
destined for port 53 to the external address of your DMZ firewall
FORWARD packets to TCP and UDP ports 53
FORWARD all ESTABLISHED and RELATED packets

Plus anything else you want your LAN firewall to do...

Then, on your DMZ firewall:

PREROUTING translate all TCP and UDP packets addressed to the firewall itself 
for port 53, to 10.0.0.10
FORWARD packets to TCP and UDP ports 53
FORWARD all ESTABLISHED and RELATED packets
POSTROUTING translate all outgoing packets to have a source address of the 
DMZ firewall

See if that helps ?


Antony.

