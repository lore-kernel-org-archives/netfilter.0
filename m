From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: ROUTE  woes ?
Date: Tue, 23 Aug 2005 21:23:22 +0200
Message-ID: <21804.2391854853$1124825131@news.gmane.org>
References: <430B664F.3030006@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430B664F.3030006@eccotours.dyndns.org>
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
To: 'Brent Clark' <bclark@eccotours.dyndns.org>, 'iptables' <netfilter@lists.netfilter.org>

Hi,

> gate:/usr/src# iptables -t mangle -A FORWARD -p tcp --dport 80 -j ROUTE --
> oif eth2

  It must be used on the POSTROUTING chain of the mangle table.

  Regards,

- Ruben



