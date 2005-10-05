From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: IP and MAC Address check
Date: Wed, 5 Oct 2005 07:23:53 +0200
Message-ID: <47950.4262832508$1128489930@news.gmane.org>
References: <006f01c5c96c$512f1c20$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006f01c5c96c$512f1c20$580110ac@HO.lippogeneral.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

> what I need is to configure iptables to read maclist file when there is
> incoming trafic from the IP address 172.16.2.241 to 172.16.2.250 ..if the
> MAC Address listed then the traffic will allowed otherwise the traffic
> will
> be dropped or rejected..

  That's were you were showed to implement.

> > while read mac; do
> >   iptables -A INPUT -m mac --mac-source $mac -m iprange --src-range \
> >    172.16.2.241-172.16.2.250 -j ACCEPT
> > done < /path/to/maclist
> > iptables -A INPUT -m iprange --src-range 172.16.2.241-172.16.2.250 -j
> DROP

  You can't create "condicional" rules with iptables, you only create the
rules you need, and if such condition ever exists, the rule will be applied.
If it never does, the rule will never be applied.

-Ruben



