From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
Subject: Problem in patch-o-matic-ng
Date: Thu, 29 Dec 2005 20:37:12 +0530
Message-ID: <BAY105-F30F837C998381A90AFFCEF9E290@phx.gbl>
References: <43B3CBE6.1090908@eurodev.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43B3CBE6.1090908@eurodev.net>
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello to all,

I  have downloaded the latest version of patch-o-matic-ng. from netfilter=20
websites,also svn checkout for update  and now my patch of random and nth=20
patch for load balancing , I have applied the following commands
1.   iptables -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW =

-m nth --counter 0 \
--every 4 --packet 0  -j DNAT --to-destination 192.168.0.5:80

2. -A PREROUTING -i eth0 -p tcp --dport 80 -m state --state NEW -m random=20
--average 25  \
-j DNAT --to-destination 192.168.0.5:80

But  i am getting the following error
iptables: No chain/target/match by that name.

My iptable version is   iptables-1.3.4 , Kernel version  linux-2.6.14.4

For this i have first applied random and nth patch rule from patch-o-matic.
after that recompile my kernel with iptables.

plz help me ..

Thanks in advance.

_________________________________________________________________
NRIs, paying for Money Transfers to India? Use Money2India. It=92s FREE=20
http://creative.mediaturf.net/creatives/msn_product.htm


