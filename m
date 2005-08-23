From: "Ruben Cardenal" <ruben@ruben.cn>
Subject: RE: ROUTE  woes ?
Date: Tue, 23 Aug 2005 22:20:53 +0200
Message-ID: <30770.6466097899$1124828825@news.gmane.org>
References: <430B83A1.1000908@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430B83A1.1000908@eccotours.dyndns.org>
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
To: 'iptables' <netfilter@lists.netfilter.org>

Hi,

> You 100% correct, thanks for setting me straight, but i still struggling,
> since I dont have the target ROUTE in my kernel
> 
> gate:~# iptables -t mangle -A POSTROUTING -p tcp --dport 80 -j ROUTE --oif
> eth2
> iptables: No chain/target/match by that name
> gate:~#
> 
> Ive been looking at the various path o matics, and I cant find the patch
> my kernel.

  This target belongs to the extra respository of patch-o-matic:

  http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-ROUTE

  In order to be able to use it, you must download also iptables and
patch-o-matic and compile all the needed stuff. The order is

  a) Apply patch-o-matic against the iptables source
  b) Compile and install iptables
  c) Recompile your kernel to generate the ipt_ROUTE module (the prior
iptables configuration will add it to your kernel tree).

 Regards,

- Ruben



