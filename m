From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Shorewall vs. Iptables
Date: Thu, 12 Feb 2004 13:56:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402121356.56294.teastep@shorewall.net>
References: <004201c3f1af$b16d7fa0$2405010a@rsa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004201c3f1af$b16d7fa0$2405010a@rsa>
Content-Disposition: inline
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
To: Ray Anderson <rsa@prideindustries.com>, netfilter@lists.netfilter.org

On Thursday 12 February 2004 01:32 pm, Ray Anderson wrote:
> Is any one better than the other?
>
> I'm currently running a RedHat box that's soon to be replaced with a
> Mandrake machine.  Of course I threw out the Shorewall stuff in favor of
> manually implementing the same Iptables ruleset(s) that I have for the RH
> machine.

Who wouldn't? :-)

Actually, I recommend against using the Mandrake Shorewall two-interface 
configuration.

a) it matches my documentation enough that cutting and pasting from the 
documentation doesn't produce errors; but
b) it is different enough that the such cutting and pasting doesn't produce 
the desired results.

>
> Does Shorewall give any more protection or is it a simply complicated
> front-end to iptables?

My opinion is far from unbiased but here goes. Shorewall is a high-level tool 
for configuring netfilter. It uses the iptables utility to do so. As a 
result, it cannot offer any more protection than the iptables utility used 
alone can provide.

As for being complicated, if you already understand iptables then Shorewall 
would be something else to learn. If you don't, then most people find 
Shorewall easier to learn. I definitely believe it to be easier to set up 
complex router/firewall configurations using Shorewall than it is using 
iptables directly unless you have spent a long time developing your own very 
flexible firewall/router framework (in other words, your own Shorewall-like 
facility).

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



