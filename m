From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: just wanted to clarify the limit match extension
Date: Sun, 30 Mar 2003 12:31:26 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303301218300.22584-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: iptables mailing list <netfilter@lists.netfilter.org>


  once upon a time, i was trying to understand limit matching,
and i recall reading some explanation that was totally
incomprehensible involving far too much math for what
turned out to be a simple concept. 

  i've just refreshed my memory of what i thought it meant,
and tested it.  so here's my take on it -- feel free to
correct my thinking.  as an example, consider the following
combination:

  # iptables -A INPUT --protocol icmp --icmp-type 0 \
	-m limit --limit-burst 3 --limit 6/minute -j ACCEPT

IOW, limit incoming ping replies (just for experimental
purposes).

  all the above does is start you off with 3 tokens (limit-burst),
and you have to pay for each reply you accept.  once you run out
of tokens, no more replies, except that 6/minute, or every 10
seconds, you are replenished with another token.  that's it.

  testing this, what you should see (and what i saw), were
the first three replies accepted, then nothing until second
10, when i got another token, which i immediately spent, then
another accept at 20 seconds, then 30 seconds, and so on.
at no time are you allowed to hold more than "limit-burst"
tokens at a time.

  worked just fine.  i don't recall where i read the
mathematical explanation of this feature, but i remember
thinking i was going to have to drag out my old calculus
books for something that turned out to be fairly obvious.

rday


