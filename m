From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: SNAT seems to "miss" some packets
Date: Mon, 29 Jan 2007 14:24:47 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701291424170.5077@yvahk01.tjqt.qr>
References: <1003211157.20070129141238@kurgan.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1003211157.20070129141238@kurgan.org>
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
To: Fabio Muzzi <liste@kurgan.org>
Cc: netfilter@lists.netfilter.org


>iptables -t nat -A POSTROUTING -o eth2  -j SNAT -s 10.0.0.0/16 --to-source 217.221.234.74

Make sure there are no other terminating rules in POSTROUTING that could stop a
packet from reaching this SNAT rule.


	-`J'
-- 

