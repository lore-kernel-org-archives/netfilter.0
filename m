From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: availability of ROUTE target
Date: Sun, 6 Mar 2005 12:12:54 -0500
Message-ID: <876ef97a05030609126e4aa085@mail.gmail.com>
References: <Pine.LNX.4.61.0503060105470.9386@forty-thieves.cis.upenn.edu>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.61.0503060105470.9386@forty-thieves.cis.upenn.edu>
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
Content-Type: text/plain; charset="us-ascii"
To: Yun Mao <maoy+netfilter@cis.upenn.edu>, netfilter <netfilter@lists.netfilter.org>

On Sun, 6 Mar 2005 01:08:05 -0500 (EST), Yun Mao
<maoy+netfilter@cis.upenn.edu> wrote:
>    I can't find ipt_ROUTE.c in my 2.6.10 kernel source. I tried google
> "ipt_ROUTE" but only diff patches were found. Any hint on how to use
> the ROUTE target? Thanks!

It's not part of the vanilla sources. To get the ROUTE target, you
need to apply it from patch-o-matic. Check out
http://www.netfilter.org/ for more information on that.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

