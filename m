From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: IP conflicts
Date: Fri, 23 May 2003 08:01:13 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019237@wardrive.citadelcomputer.com.au>
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

There is no way unless the firewall is between all machines ie. each =
machien MUST go through the firewall ) which is pretty damn useless.

That's where you run DHCP and use good network management.

I have a s^%$ load of network connections into work and it's so complex =
that noone here wants to know about IP assignments etc.etc..

I have this:

DHCP for main network
192.168.0.129-200

Dialup for 8 modems
192.168.0.121-128

DHCP static assign workstations (known hosts get this via MAC listings)
192.168.0.65-120

Servers (Manual IP entered)
192.168.0.1-63

THEN, I have VPN clients which come over on another subnet an route =
through it via the 192.168.0.254 firewall IP.. and then there's the =
clients who come over the VPN and on the same IP but are blocked except =
for the server/port they are allowed access to.. damn confusing really.

But the main thing is that I've never had a conflict, ever..

the reason the workstations are all static assigned DHCP addresses is =
because we wanted it so if anybody hooks into our network (visitors) =
they are given an IP of 192.168.0.129 and up.. this range is blocked on =
the firewall and gives no internet access...


Hope this gave you some insight... hope it also didn't mean I wasted my =
times typing it ;P


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
Sent: Friday, May 23, 2003 1:01 AM
To: netfilter@lists.netfilter.org
Subject: IP conflicts


Dear all,

Is there any way to prevent IP address conflicts on a network using
iptables? Can the MAC address match support or MIRROR target support =
help to
avoid IP address conflicts? Please suggest any other ways possible to do
that.

Thank you very much.

Dhyanesh Ramaiya



