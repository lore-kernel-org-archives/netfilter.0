From: "Benny Butler" <benny.butler@nexusitg.com>
Subject: RE: Multiple source question
Date: Wed, 19 Jun 2002 09:01:53 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <000e01c21799$ddca6820$0205a8c0@maxima>
References: <200206191342.g5JDg1U30168@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206191342.g5JDg1U30168@vulcan.rissington.net>
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
To: netfilter@lists.samba.org

Ok, lemme explain the setup a bit.

This machine sits between a doctors office's network and the hospital's
network. Eth1 (192.168.2.2) is static on the doctor's side, and eth0
(10.46.1.254 I believe) is on the hospital's side.  We've told the local
router that anything trying to get to the hospital should go through the
linux box, and not use it's default gw.  We've also added a route to the
linux box so it can get to 10.46.210.5.

Now, the rules.  The hospital will only let the users access this web
based X-ray viewing system across the network if they can control how
many IP's come from each office because they bought so many licenses
from GE and only allow so many connects from each office.  That's where
my box comes in.  By default the firewall denies access to each doctors
office computer.  To get access they go to the webpage on 192.168.2.2,
this php looks at their IP address and compares it to a list of IP's in
a mysql dbase.  If they are in it, it just lets them through.  If they
aren't in it it looks to see how many spaces are left.  If there's a
space left it ads them to the database, then runs the rule below to
allow their IP address to get through.  Like I said, it only allows the
first person to get through, no one else (btw, if anyone wants the php
I'll share it, it's nothing impressive)

That should answer #1 and #3



#2 sounds great.  I missed that before because I copied a rule off of my
home firewall which is a dhcp slave to comcast.  Do you think that will
fix the problem or just make the system run better?






-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
Sent: Wednesday, June 19, 2002 8:42 AM
To: netfilter@lists.samba.org
Subject: Re: Multiple source question


On Wednesday 19 June 2002 2:31 pm, Benny Butler wrote:

> Ok, after much hacking together the rule below I finally get the
machine
> at 192.168.2.70 to access 10.46.210.5.  Great, but if I run the same
> rule on any more internal IP addresses, still only 2.70 works.
>
> sudo /sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.70 -d /
> 10.46.210.5 -p tcp --dport 80 -j MASQUERADE

1. Why do you need to use Source NAT at all in order to access the
machine on 
10.46.210.5 ?   What is there in the routing tables which prevents 
192.168.2.70 from accessing 10.46.210.5 and the replies going back again

without any NAT involved ?

2. I think you should be using -j SNAT --to a.b.c.d instead of -j
MASQUERADE.

You must surely have a fixed address on eth0 (ie it's not DHCP)
therefore 
SNAT is the way to do it - it's much clearer what the rule is doing, and
it's 
(marginally) more efficient in operation.

3. Maybe I've missed something earlier that you've posted (?) but please
can 
you explain your network setup what you're trying to do / what doesn't
work ?

 

Antony.


