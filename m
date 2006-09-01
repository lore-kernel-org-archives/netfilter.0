From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filter ips
Date: Fri, 1 Sep 2006 09:56:18 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609010956010.13189@yvahk01.tjqt.qr>
References: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
	<44F7E55B.5000406@freemail.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44F7E55B.5000406@freemail.hu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org, nunezj@ucbcba.edu.bo

>
> iptables -A INPUT -s 192.168.0.5 -p tcp -m multiports --dports 20,21 -j DROP
                                                      ^

-m multiport


Jan Engelhardt
-- 

