From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: I'm having difficulty making port redirection work
Date: Tue, 1 Jul 2003 08:59:19 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BE9E@wardrive.citadelcomputer.com.au>
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
To: Michael Martinez <mmartinez@csrees.usda.gov>
Cc: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Read that tutorial very carefully and you'll pickup the differences of =
iptables to ipchains.

just remember that INPUT/OUTPUT are for packets going to and from the =
firewall ONLY, not forwarded or NATed packets unlike ipchains.. check =
the graphs and you'll see what I mean..

What your looking for is part of PREROUTING chain not INPUT and you =
forgot the -t nat switch.

iptables -A PREROUTING -i $INTDEV -t nat -p tcp --dport 80 -j REDIRECT =
--to-port 8888

try that.. and if all else fails.... LOG EVERYTHING!

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Michael Martinez [mailto:mmartinez@csrees.usda.gov]
Sent: Tuesday, July 01, 2003 5:37 AM
To: netfilter@lists.netfilter.org
Subject: I'm having difficulty making port redirection work


Hi all -

I've used ipchains before, but I'm brand new to iptables, and I'm having
difficulty getting port redirection to work.

Here's what I want to do: I've got a Redhat 8.0 box running iptables
1.2.6a2. I've got a web application listening on port 8888 (on the eth0
interface) and  I'd like any web traffic coming in on port 80, to be
redirected to port 8888.

In ipchains, this is handled with the following line in
/etc/sysconfig/ipchains:

-A input -d 192.73.224.127 80 -p tcp -j REDIRECT 8888

I am using the following lines at the beginning of
/etc/sysconfig/iptables, but it does not work. I'm getting no messages
in /var/log/messages, and I don't know of any place where iptables is
logging anything:

*nat
-A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8888
COMMIT

How do I troubleshoot and fix this?

thank you -

--=20
Michael Martinez
Linux System Administrator
Marlaw Systems Technology Inc.
CSREES/ISTM/USDA
mmartinez@csrees.usda.gov


