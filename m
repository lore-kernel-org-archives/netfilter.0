From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: No Internet Connection
Date: Fri, 10 Sep 2004 12:24:04 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4141E334.90209@pbl.ca>
References: <20040910144901.42036.qmail@web50204.mail.yahoo.com>	<4141D921.8020100@pbl.ca>
	<1094835410.1900.151.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094835410.1900.151.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> i don't know that i agree with this statement.  when a packet reaches
> the end of custom chain "tcp_invalidos" and has not matched any rules in
> that chain--it should return to the calling chain where it left off;
> i.e.
> 
>         iptables -P INPUT DROP
>         iptables -A INPUT -j badstuff
>         iptables -A INPUT -j goodstuff
>         iptables -A INPUT -j LOG
>         
> a packet not matching any rule in "badstuff" will return to INPUT, and
> then jump to "goodstuff"...  if the packet doesn't match any rule in
> "goodstuff" it will return to INPUT, get logged, and *then* get dropped,
> as it has hit the end of the INPUT chain and not matched any rules. 
> only then does the POLICY of the chain get enforced.

Hm, interesting...  I vaugly remember (I might be wrong) testing 
something similar a while ago, and I got different results.  Anyhow, 
this seems to be undocumented ("man iptables" doesn't say what happens 
when end of user defined chain is reached).  Could it be that it changed 
from one version to another?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

