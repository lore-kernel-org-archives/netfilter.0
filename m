From: Tom Eastep <teastep@shorewall.net>
Subject: Re: kernel2.6.2-3 + iptables/shorewall
Date: Thu, 19 Feb 2004 07:22:01 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402190722.01309.teastep@shorewall.net>
References: <1077202137.4302.12.camel@gb7tf.org.uk> <1077202860.1578.13.camel@pepelui.baicom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077202860.1578.13.camel@pepelui.baicom>
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
To: Alexis <alexis@attla.net.ar>, Richard Bown <richard.bown@blueyonder.co.uk>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

On Thursday 19 February 2004 07:01 am, Alexis wrote:
> Yes, i have at least 4 firewalls running SNAT and DNAT with 2.6.2 and
> iptables 1.2.9 without any problem. (using redhat 8,9 or debian)
>
>
>
> IP forwarding could be enabled and disabled at
>
> /proc/sys/net/ipv4/ip_forward if this is your question
>

Which in turn is controlled by IP_FORWARDING in shorewall.conf.

-Tom
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net



