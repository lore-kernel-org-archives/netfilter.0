From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help with wireless routing
Date: Thu, 31 Jul 2003 11:33:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C01A@wardrive.citadelcomputer.com.au>
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
To: Jason <arnjuka@optonline.net>, netfilter@lists.netfilter.org

have you turned on ip forwarding??

        echo 1 > /proc/sys/net/ipv4/ip_forward


have you done a tcpdump and/or -j LOG of all packets...???

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
From: Jason [mailto:arnjuka@optonline.net]
Sent: Thursday, July 31, 2003 11:25 AM
To: netfilter@lists.netfilter.org
Subject: help with wireless routing


I'm setting up a wireless access point for my local community.  I have
an external cantenna that I'm building for it. It's running redhat9 and
a netgear card that has the prism2 chipset and the hostap driver
installed.

The box has 3 network connections:

eth0 - dsl
eth1 - wired network
wlan0 - wifi network

I need to route traffic between the three connections.  The internet
iface will have a dynamic ip address from a dsl provider.  The other two
will only have private ips.  I was reading the Linux Wifi Access Point
howto and they say to setup zebra and ospfd.  I've tried this and it
desn't seem to work.

Whats the best way to route traffic between these all 3 ifaces.  What
should I use for security.

If anyone has an examples, or good docs for me to read, please point me
in the right direction.

- jason




