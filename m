From: =?iso-8859-1?Q?KUCKAERTZ_R=E9gis_-_NVISION?= <regis@nvision.lu>
Subject: RE: Port forwarding
Date: Fri, 17 Sep 2004 15:52:37 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C8JAE-0001Pb-00@deer.gmane.org>
References: <1095428035.1886.36.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095428035.1886.36.camel@wolfpack.ljm.dom>
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
To: netfilter@lists.netfilter.org

> is it possible that $REAL_IP is a local IP address on the 
> machine running netfilter?  the reason i ask is that the 
> packet counters on the FORWARD chain are zero (whereas INPUT 
> and OUTPUT are over 40000).

Unfortunately, it is not. Really weird, since packets are correctly DNAT'ed
_before_ going through the filter rules, then the kernel should detect that
they are not intended to it, neh?

I tried tcpdump'ing the $REAL_IP and $REAL_PORT, but then nothing matched
the filter.

I must have forgot one thing, since _it worked_ in the past!! :'(

Thanks for your help!

> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
> 


