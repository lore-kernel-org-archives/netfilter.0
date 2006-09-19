From: "Daniel " <daniel@eskozoo.com>
Subject: iptables drops _some_ valid packets
Date: Tue, 19 Sep 2006 10:52:18 -0300
Message-ID: <40fff57a0609190652n2dce5f49ie37ec04952d2d139@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,
Im running a small network behind a firewall running iptables 1.3.5 doing NAT.
The firewall has two NICs, eth0 for the LAN and eth1 to a adsl modem.

Im having problems with iptables dropping some packets that belong to
an established/valid connection. I think this only occurs with
http/https traffic. For example, if I have a client on LAN browsing
somesite.com the connection gets tracked and iptables allows packets
coming and going but, and here is my problem, it will drop *some*
packets coming from somesite.com . Hence my logs get filled with this
packets that should have gone through.
As you might imagine this is rather annoying, even more so when I
havent been able to find a solution browsing google for countless
hours. Please if this post lacks information, let me know and Ill post
whatever you need.

Thank you,

Daniel.

