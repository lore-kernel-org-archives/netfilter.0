From: "A. Clausen" <techlists@alberni.net>
Subject: Problems with Linux Firewall
Date: Tue, 15 Jul 2003 14:56:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c34b1b$e4079c10$0f00a8c0@tandem>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

We've been running a Linux 2.4.19 firewall for about a year and a half
now, using Netfilter and proxyarp so that devices on both side of the
firewall can be on the same subnet.  We run a wireless network, using
wireless bridges, so these should be largely invisible to the Linux
box.

Within the last four months we have suspected there is a slow down.
I've upgraded to 2.4.21 and upgraded netfilter/iptables to 1.2.8, to
no effect.  Just to test things out, I grabbed an old 10mbit hub so
that I could see performance locally, and not just through the
wireless network.

Everything seemed to be going fine (around 1050kbs on an FTP
transfer), but I discovered that while that download was going on, no
other traffic, including 32 byte pings, would go through.

Now I realize that hubs are only half-duplex, but I don't ever recall
this situation, and it seems to indicate a problem with the Linux
firewall.  One bad thing is that I'm running some Realtek cards (I
know I shouldn't but they've worked for over a year).

Does anybody have any ideas or suggestions?

-- 
Aaron Clausen

techlists@alberni.net

