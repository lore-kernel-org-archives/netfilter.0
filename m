From: netfilter.org@neo-neural.net
Subject: NAT, conntrack, FTP, multihomed host
Date: Thu, 10 Oct 2002 10:20:48 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210101002330.11967-100000@ward.neo-neural.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've got a Slackware box running the 2.4.19 kernel with all the required
modules for FTP connection tracking (ip_nat_ftp, ip_conntrack_ftp, etc.)
compiled into the kernel. (Did it this way instead of modules as I'd
already tried loading them as modules under 2.4.18; lsmod showed
ip_nat_ftp as "unused" and active FTP failed to work... when connecting
to a MS-based ftp server and performing an 'ls' via active mode, the
connections cease after "150 Opening ASCII mode data connection for
/bin/ls". Basically the same thing happens on any other type of FTP
server.)

The "router" is currently using the gShield 2.8 iptables script, although
I've tried many, many simple and/or insecure scripts or hand-entered rules
with exactly the same result; active FTP will not work. (Passive works,
and yes, I try to use it all the time... but active should work, darn it!)
I've googled until my eyes are red and blurry, and yes, I've read the
tutorial and the HOWTOs... when I follow the directions to the letter,
nothing works. Essentially, it appears that the NAT module doesn't know
what to do with the incoming server connection: I can see it arrive via
tcpdump, but it is never forwarded to the workstation in question when
the "proper" iptables rules are in place.

The only way I can get active FTP and a few other "stupid"
applications/protocols to work properly is to add a prerouting entry to
forward everything not already re-directed to the server over to the
workstation, which completely defeats the security benefits of NAT for
that workstation. This also won't allow two NAT'ed hosts to use a "stupid"
protocol on the network to a remote location at the same time.

kernel 2.4.19
iptables 1.2.7a
Intel CPU
96MB ram
multihomed: 100Mb ethernet to lan, and 10Mb ethernet to DSL router

Please, please, let me know what additional info is needed - I'll gladly
share it.



