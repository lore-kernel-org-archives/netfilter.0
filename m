From: Jason <arnjuka@optonline.net>
Subject: help with wireless routing
Date: Wed, 30 Jul 2003 21:25:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F287001.6E47AC4B@optonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

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



