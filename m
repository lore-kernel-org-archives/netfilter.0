From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: OT: Pings phenomen :)
Date: Sun, 29 Aug 2004 05:29:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093771753.1659.8.camel@grendel>
References: <213736141.20040828221628@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <213736141.20040828221628@op.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Marcin Sura <slacklist@op.pl>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 2004-08-28 at 16:16, Marcin Sura wrote:
>
>   I have 512/128 adsl. I wonder why, when I download files at full
>   speed, pings to site X are about 2000ms. But when I upload files at
>   full speed, pings to X are about 3000 to 5000ms. Can someone explain
>   this to me from tcp/ip point of view? ;)

512 is download speed
128 is upload speed

When you are uploading a file you are sucking up bandwidth on the
smallest portion of your link. This means greater congestion than when
doing a download, so the latency on your echo-request packets is higher.

HTH,
Chris



