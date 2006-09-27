From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables REJECT NAT Internal -> External Portrange
Date: Wed, 27 Sep 2006 18:30:38 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609271830190.17586@yvahk01.tjqt.qr>
References: <4F7EDC4D48D076428187517D1D77B017239AA5@mercury.int.sealevel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4F7EDC4D48D076428187517D1D77B017239AA5@mercury.int.sealevel.com>
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
To: Ryan Belcher <Ryanb@sealevel.com>
Cc: netfilter@lists.netfilter.org


>iptables -t nat -A PREROUTING -i eth2 -p tcp --dport 10000:11000 -j REJECT --reject-with icmp-host-unreachable
>
>The above command returns with "Invalid Argument".

REJECT is to be used in -t filter.


Jan Engelhardt
-- 

