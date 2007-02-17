From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Whats faster? multiple rules vs. multiport match
Date: Sat, 17 Feb 2007 14:55:48 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702171428540.32079@yvahk01.tjqt.qr>
References: <20070215213729.GA27689@outback.rfc2324.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070215213729.GA27689@outback.rfc2324.org>
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
To: Maximilian Wilhelm <max@rfc2324.org>
Cc: netfilter@lists.netfilter.org


On Feb 15 2007 22:37, Maximilian Wilhelm wrote:
>Subject: Whats faster? multiple rules vs. multiport match

Of course a multiport match. Not that I have any hard proof for that, but
it's a feeling.

To match N ports with N rules, you will need to call N times into
xt_tcpudp of cost T.

To match N ports with N/20 rules using a multiport spec, you will need to
call N/20 times into xt_tcpudp of cost T and N/20 times into xt_multiport
of cost M.

For

  T*N < T*N/20 + M*N/20,  with N->Infinity

to hold,

In[9]:= Reduce[t*n < t*n/20+m*n/20, t]

                                             m                    m
Out[9]= m \[Element] Reals && ((n < 0 && t > --) || (n > 0 && t < --))
                                             19                   19

we need T < M/19, or interpreted, xt_tcpudp needs to run through about 19
times less instruction/lines than xt_multiport, which seems unrealistic,
since xt_multiport's match function has (by eye) roughly the same number
of LoCs as xt_tcpudp.

Of course this is just theory, there might be a bug in my thinking, or
it's a close tie, and only a benchmark - I am not aware of any yet - can
prove it.


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

