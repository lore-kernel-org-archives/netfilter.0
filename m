From: "Wycliffe Bahati" <wbahati@afsat-ke.com>
Subject: Re: Microsoft VPN
Date: Thu, 1 Jul 2004 12:07:56 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03f601c45f4a$e92dad80$1700000a@afsatke.local>
References: <76408279273F86419EA113F4CC5BB13D026C5E@EXCHANGE.InsideNCS.local>
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
To: Narti Kitiyakara <Nkitiyakara@nolacom.com>, netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Narti Kitiyakara" <Nkitiyakara@nolacom.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 8:27 PM
Subject: Microsoft VPN


We're having trouble accessing our Microsoft VPN server through an iptables
firewall.  The first person to connect gets in fine, but we can't make
concurrent VPN connections.  We used guarddog and guidedog to set up most of
the firewall, but guidedog doesn't know how to DNAT based on IP protocol, so
we added an initialization script to run level 5 (below) to DNAT based on
protocol.  As I said, we're just perplexed as to why this would work for one
user but not additional users.  Any help will be greatly appreciated.

/sbin/iptables -t nat -A ftolocal -p gre -j DNAT --to-destination 1.2.3.4
/sbin/iptables -t mangle -A ftolocal -p gre -j MARK --set-mark 1
/sbin/iptables -t nat -I PREROUTING 1 -p gre -j gforward


- narti
Have u tried to uses snat to do a direct translation to the MS


