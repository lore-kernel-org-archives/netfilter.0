From: "Miguel Carvalho" <miguel@ipatimup.pt>
Subject: Iptables and shutdown trouble
Date: Fri, 13 Sep 2002 17:11:50 +0100 (WEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6873.213.13.176.13.1031933510.squirrel@www.ipatimup.up.pt>
Reply-To: miguel@ipatimup.pt
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

We are having some troubles when we try to shutdown the system.
This appens after we put Iptables to work.
When the shutdown enter the Ethernet interface shutdown( eth0 ), it hangs
completelly. The solution is to turn-off the server.
I'm not shure, but it seams to me that something is still using the
network interface when it reaches the Interfcae shutdown stage.
Do i have to unload the iptbales, conntrack, etc manually before shutting
down?
Does any one have this touble or know how can i solve it?

Miguel



