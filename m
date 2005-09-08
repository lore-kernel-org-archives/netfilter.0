From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: blocking outbound irc
Date: Thu, 8 Sep 2005 08:07:30 +0200
Message-ID: <4397.83909027955$1126159778@news.gmane.org>
References: <bc5becf605090721411c969411@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bc5becf605090721411c969411@mail.gmail.com>
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

> Can anyone send me the iptables line(s) I would need to block all outgoing
> access to remote irc (ports 6668, etc.).

  Regular IRC ports are 6660-6669 and 7000. So..

  iptables -I OUTPUT -p tcp -m multiport --destination-ports
6660,6661,6662,6663,6664,6665,6666,6667,6668,6669,7000 -j DROP

  Regards,

- Ruben



