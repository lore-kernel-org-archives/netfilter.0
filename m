From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: PREROUTING
Date: Fri, 19 Sep 2003 09:48:29 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309190941520.25583@simba.math.ucla.edu>
References: <200309191748.19695.woksy@ether.net1.nerim.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309191748.19695.woksy@ether.net1.nerim.net>
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
To: Mickael DILY <woksy@ether.net1.nerim.net>
Cc: netfilter@lists.netfilter.org

On Fri, 19 Sep 2003, Mickael DILY wrote:
> I would like to add the following line to my firewall
> iptables -A PREROUTING -t mangle -p tcp --sport ssh -j TOS --set-tos\
> Minimize-Delay
> iptables -A PREROUTING -t mangle -p tcp --sport ftp -j TOS --set-tos\
> Minimize-Delay
> iptables -A PREROUTING -t mangle -p tcp --sport ftp -j TOS --set-tos\
> Maximize-Throughput

I thought you could set only one type of service on a packet.  Did you
perhaps mean "--sport http" in the middle line?  Though given the bloated
advertisement-crammed web pages we often see, maybe "Maximize-Throughput"
would be more appropriate (just joking; each advt. needs a separate
connection and so "Minimize-Delay" is what you want.)

> When i do this, nothing tells me if it is good or bad. I presume it is good.
> But, when i list my iptables, i see nothing in the rule PREROUTING.
> I think it is not normal. Where do i bug  ?

Did you actually list the mangle table with all the special arguments?
E.g. "iptables -t mangle -L -v".

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

