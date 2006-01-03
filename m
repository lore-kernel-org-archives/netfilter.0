From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: intelligent load balancing
Date: Tue, 3 Jan 2006 08:41:55 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0601030841240.23554@yvahk01.tjqt.qr>
References: <BAY103-F222975DA0359A6311DC097B22D0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F222975DA0359A6311DC097B22D0@phx.gbl>
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
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org


> I'm doing simple load balancing with two cheap adsl lines using
> nth to SNAT packets:
>
> -m nth -every 2 -packet 1 -SNAT adslA
> -m nth -every 2 -packet 2 -SNAT adslB
>
> This is working quite good, but I would like to do an intelligent
> load bal.

try lartc/tc.

> As you can see adslB line is full and adslA line is empty.
> Is there anyway to optimize this?

Use tc, a per-packet load balancing; -m nth is just a per-connection 
balancing.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/
| jengelh's site, http://jengelh.hopto.org/

