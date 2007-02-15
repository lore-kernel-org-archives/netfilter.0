From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: bridge problem
Date: Thu, 15 Feb 2007 17:54:39 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702151753450.786@yvahk01.tjqt.qr>
References: <BAY131-F1857AFF907BF1716A253BBE2960@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY131-F1857AFF907BF1716A253BBE2960@phx.gbl>
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
To: saravanan chanemouganandam <saravanan_sprt@hotmail.com>
Cc: netfilter@lists.netfilter.org, bridge@lists.osdl.org


On Feb 15 2007 22:06, saravanan chanemouganandam wrote:
>
> ifconfig eth0 0.0.0.0
> ifconfig eth1 0.0.0.0

That's a no-op. What you need is `ip l s eth0 up` (same for eth1)

> are configured. The problem is that, I can't ping the Router from the Host. But

brctl sethello br0 1



Jan
-- 
ft: http://freshmeat.net/p/chaostables/

