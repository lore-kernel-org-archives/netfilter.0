From: mailist@orbisindonesia.com
Subject: LAN IP in squid's access log
Date: Wed, 10 Sep 2003 16:44:13 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37437.202.153.225.213.1063187053.squirrel@goliath.3wsi.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

As described in iptables docs. I want to get real LAN IP in my squid proxy
instead of Gateway IP. That means I have to use internal DNS, right ?

The Internal DNS has run, but the LAN PCs still can not go out to internet
without the gateway POSTROUTING it to squid cache. ( IP being logged in squid
is still Gateway's IP only. )


LAN's network : 10.11.0.0/16
Gateway : 10.11.6.1 / 1.2.3.4
squid IP : 10.11.6.2 / 1.2.3.5


Are my settings correct ?




