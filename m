From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[3]: how to negate a limit match?
Date: Sun, 2 Nov 2003 14:55:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <109602979308.20031102145527@lf.lv>
References: <Pine.LNX.4.44.0311020630160.10439-100000@localhost.localdomain>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0311020630160.10439-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

Sunday, November 2, 2003, 1:32:00 PM, you wrote:

RPJD> On Sun, 2 Nov 2003, Peteris Krumins wrote:

>>
>> Limit cannot be negated...

RPJD> from the iptables man page:

RPJD> limit 

RPJD>   This module matches at a limited rate using a token bucket filter.  A
RPJD> rule using this extension will match until this limit is reached (unless
RPJD> the ! flag is used).  It can be used in combination with the LOG target to
RPJD> give limited logging, for example.

Do you believe in everything said?
Someone once said that computers will never need more than 640KB of
ram..

RPJD>   so the man page clearly suggests that the limit match can be negated.
RPJD> i'm just not sure how one would do it.  what's the syntax?

The syntax is:
 cd /usr/src/linux/net/ipv4/netfilter
 grep 'invert' ipt_limit.c
 if [ $? -gt 0 ]; then
   echo "'!' is not implemented in this match module"
 fi
 cd -

 
P.Krumins


