From: "Lane Brooks" <lane@brooks.nu>
Subject: pptp and nat
Date: Tue, 24 Sep 2002 03:46:11 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209240346.g8O3kBl06609@brooks.nu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a linux firewall/nat server that is working well using iptables.  I also
have a pptp client on this machine (ppp0).  The internal network is
192.169.0/24 on eth0 and the internet is on eth1.  NAT is working fine for
everything except the pptp connection.  The pptp connection works fine from
the firewall machine, but nothing on the internal network can talk through it.
 I used to have ipchains on kernal 2.2, and internal computers could talk fine
through the pptp connection, so I am thinking I need to add something more to
my iptable rules.  Any ideas or help?  My routing table is exactly the same as
that which used to work on ipchains with the older kernel, so I dont think it
is that.

Thanks
Lane Brooks



