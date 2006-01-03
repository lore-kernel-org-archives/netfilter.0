From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: intelligent load balancing
Date: Tue, 03 Jan 2006 10:17:05 +0100
Message-ID: <BAY103-F148EEBC380AA0B3B51509CB22C0@phx.gbl>
References: <Pine.LNX.4.61.0601030841240.23554@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0601030841240.23554@yvahk01.tjqt.qr>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jengelh@linux01.gwdg.de
Cc: netfilter@lists.netfilter.org


Jan Engelhardt wrote:

> > I'm doing simple load balancing with two cheap adsl lines using
> > nth to SNAT packets:
> >
> > -m nth -every 2 -packet 1 -SNAT adslA
> > -m nth -every 2 -packet 2 -SNAT adslB
> >
> > This is working quite good, but I would like to do an intelligent
> > load bal.
>
>try lartc/tc.
>
> > As you can see adslB line is full and adslA line is empty.
> > Is there anyway to optimize this?
>
>Use tc, a per-packet load balancing; -m nth is just a per-connection
>balancing.

this would be useful for 'upload' packets not for download. Right?
The main problem are 'download' packets which can be per-connection
balanced only.
Thanks for the reply.



