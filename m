From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: max number of connection
Date: Mon, 8 Jan 2007 21:43:24 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701082143060.23737@yvahk01.tjqt.qr>
References: <BAY110-DAV3EC00E1ACEC181C4B8FFFBABC0@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY110-DAV3EC00E1ACEC181C4B8FFFBABC0@phx.gbl>
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
To: "Carlos Eduardo R. L. de Miranda" <cerlm@hotmail.com>
Cc: netfilter@lists.netfilter.org


>Hello all,
>
>Is it possible to limit the number of concurrent connection (input/output -
>tcp/udp) each IP (node) can have at any given time?

-m connlimit


	-`J'
-- 

