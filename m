From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: [OT] Little TCP/IP question
Date: Sun, 22 Aug 2004 18:58:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093215507.1659.5.camel@grendel>
References: <112010952.20040823004437@op.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <112010952.20040823004437@op.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Marcin Sura <slacklist@op.pl>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sun, 2004-08-22 at 18:44, Marcin Sura wrote:
>
>   What is the TCP/IP algorithm that control usage of bandwidth by sessions
>   (flows?)?

This is going to vary based on the window size. Its not surprising that
the first session is getting more bandwidth as its had more time to
negotiate a larger window size and a smaller inter-packet gap. Its also
not surprising that this changes over time due to the latency caused by
the line being saturated.

If you want to even this out, your best bet would be to implement some
QoS. Not sure its so far off that its really worth it though.

HTH,
Chris




