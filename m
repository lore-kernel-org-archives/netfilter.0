From: J Kim <jindor@yahoo.com>
Subject: Differentiating direct, and redirected access?
Date: Sun, 17 Oct 2004 19:19:48 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041018021948.48396.qmail@web50902.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

I'm running a squid at port 3128 as a transparent proxy.

There are requests coming directly to 3128 port and 
those coming to 80 port and then redirected to 3128 by 
following rule:

-t nat -A PREROUTING -i eth0 -p tcp -m tcp \
   --dport 80 -j REDIRECT --to-ports 3128

What I want is block direct requests to 3128, allowing
redirected access (transparent proxy) only. How do I do it?

If I just set up a rule in filter chain like:

-t filter -A INPUT -i eth0 -p tcp -m tcp \\ 
   --dport 3128 -j DROP 

Those requests redirected from port 80 to 3128 are also
blocked by this rule. It seems that the redirected packets
come in to this chain once again with the new port number.

How can I differentiate these two different kinds of
request? Any clue will be greatly appreciated.

Jinsuk Kim



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

