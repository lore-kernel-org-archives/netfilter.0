From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re[3]: how to negate a limit match?
Date: Sun, 2 Nov 2003 08:10:20 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311020809350.16066-100000@localhost.localdomain>
References: <109602979308.20031102145527@lf.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <109602979308.20031102145527@lf.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peteris Krumins <newsgroups@lf.lv>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Sun, 2 Nov 2003, Peteris Krumins wrote:

> Sunday, November 2, 2003, 1:32:00 PM, you wrote:
> 
> RPJD> On Sun, 2 Nov 2003, Peteris Krumins wrote:
> 
> >>
> >> Limit cannot be negated...
> 
> RPJD> from the iptables man page:
> 
> RPJD> limit 
> 
> RPJD>   This module matches at a limited rate using a token bucket filter.  A
> RPJD> rule using this extension will match until this limit is reached (unless
> RPJD> the ! flag is used).  It can be used in combination with the LOG target to
> RPJD> give limited logging, for example.
> 
> Do you believe in everything said?

well, no.

> The syntax is:
>  cd /usr/src/linux/net/ipv4/netfilter
>  grep 'invert' ipt_limit.c
>  if [ $? -gt 0 ]; then
>    echo "'!' is not implemented in this match module"
>  fi
>  cd -

i'm sorry.  i don't believe you. :-)

rday


