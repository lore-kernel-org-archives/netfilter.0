From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Port forwarding
Date: Fri, 6 Jun 2003 09:08:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019263@wardrive.citadelcomputer.com.au>
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
To: Dhyanesh Ramaiya <dhyanesh@intafrica.com>, netfilter@lists.netfilter.org

PREROUTING only works for packets passing through the firewall and not =
FOR the firewall to itself. There is no NAT for an incoming connection =
on it's local process as it's ALREADY there at the service not a packet =
that's coming in. if you know what I mean.

If you had multiple IPs which were NATted to an internal server then you =
can NAT the OUTPUT chain but not when the destination IP is the firewall =
itself..

One sneaky what of doing it is to put a /etc/hosts file of the internal =
machine.. eg.

192.168.0.1           www.yourdomain.com

When you browse the name it'll go directly to the internal machine. But =
remember to use names not IPs..
Outsiders get NATed and the firewall browses by the internal machine.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Dhyanesh Ramaiya [mailto:dhyanesh@intafrica.com]
Sent: Thursday, June 05, 2003 7:49 PM
To: netfilter@lists.netfilter.org
Subject: Port forwarding


Dear all,

I have a linux router (Redhat 9.0) with iptables 1.2.7a-2. I have setup =
port
forwarding rules as below to allow SMTP and POP3 to a machine on the
internal network.

iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 110 =
--to
<private_ip>:110
iptables -t nat -A PREROUTING -j DNAT -p tcp -d <public_ip> --dport 25 =
--to
<private_ip>:25

What happens, is that when I try to telnet port 25 or 110 from the =
router
itself, it doesn't connect and gives the error "Connection refused".
However, from any other machine on the network it connects. Thinking =
that
some firewall rules might be blocking the connection, the default policy =
of
all chains is set to accept.

Dhyanesh Ramaiya
dhyanesh@intafrica.com



