From: "Micah Abrams" <micah@micahabrams.com>
Subject: dns doctoring
Date: Thu, 9 Jan 2003 01:03:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FHEJJHLEAGOMBFDMFHNOAEIADKAA.micah@micahabrams.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

List --

I'm building an iptables firewall to replace my pix 506.  The firewall will
only have two interfaces for now.  My dns server sits outside my firewall on
the internet and answers queries for both my internal network and the world.
Of course it only contains real world ips.  The pix has an option (called
alias) that doctors dns request from my internal lan so that the reply
packet contains the internal ip address instead of the public address given
out by my dns server.  This lets the internal machines access internal hosts
via dns without having to run two dns servers.  For example with following
command:

alias (inside) 192.168.0.5 245.243.3.5 255.255.255.255

all dns queries passing through the pix containing the address 245.243.3.5
are re-written to contain 192.168.0.5.  My question is, is there any way to
do this with iptables?  How is everyone handling this?  I would really like
to avoid having two dns servers.  I am very new to iptables so any and all
help is much appreciated.

Thanks

~Micah


