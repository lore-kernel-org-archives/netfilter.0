From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: DNAT from an IP address that does not exist to another that exists
Date: Wed, 30 Jul 2003 13:40:44 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C003@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Carlo Florendo <carlo@hq.astra.ph>, netfilter@lists.netfilter.org

You must=20

iptables -I PREROUTING  -t nat -s 192.168.30.0/24 -i $INTDEV -d =
192.168.40.40 -j DNAT --to 192.168.40.40
iptables -I POSTROUTING -t nat -s 192.168.30.0/24 -d 192.168.40.40 -j =
SNAT --to 192.168.30.1

so basically your masquerading the internal users like you would if the =
server was outside, you replace the source IP with the masq server so =
the 192.168.40.40 (192.168.30.11) machine knows it MUST send it back via =
the gateway and NOT DIRECT to the 192.168.30.X user...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Carlo Florendo [mailto:carlo@hq.astra.ph]
Sent: Wednesday, July 30, 2003 1:14 PM
To: netfilter@lists.netfilter.org
Subject: DNAT from an IP address that does not exist to another that
exists=20


Hello iptables gurus,

How do I setup iptables such that connections to a certain non-existent =
IP address is DNAT to another IP address within the
network?

Here's an explanation of the problem.  Sorry for the verbosity.  It's my =
first time to post in this list. :-)

I have several machines on my network and one gateway machine.
I've setup the gateway to do IP masquerading and everything's fine (i.e. =
any machine from the local network can acces the  internet
flawlessly).

The gateway  runs services such as ssh and http.  Other machines on the =
local network run their respective services as well.

I want to achieve a setup such that connections to a certain =
non-existent IP address is DNAT to another IP address within the
network.

The gateway address is 192.168.30.1
The non-existent address which I want to DNAT to another machine within =
the network is 192.168.40.40
The existent IP address where I want 192.168.40.40 to be forwarded to, =
is 192.168.30.11



Here are 2 cases:

case 1).  The non-existent IP address is DNAT to the the gateway (i.e. =
the accepting machine itself).

When I do this, everything works fine.  (i.e. I get to access =
192.168.40.40 as if it really existed although what I'm really
accessing is the gateway machine 192.168.30.1).

Here is how the configuration worked:

iptables -t nat -D PREROUTING -d 192.168.40.40 -j DNAT --to 192.168.30.1

case 2).  The non-existent IP address is DNAT to another machine within =
the network (not the gateway).

Here's what I think is the solution but it does not work.

iptables -t nat -D PREROUTING -d 192.168.40.40 -j DNAT --to =
192.168.30.11

I wanted to force our users to access 192.168.40.40 since it is *NOT* in =
the same network.  Thus, all connections to it pass through
the gateway.

The solution does not work.  Are there any pointers on how to make this =
possible?

A link to the network diagram is here:  =
http://210.23.193.154/zxff/qsz.html

Thanks a lot!

Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
URL: http://www.hq.astra.ph/resources










