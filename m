From: Tom Eastep <teastep@shorewall.net>
Subject: Re: [OT?] iptables <-> shorewall equivalence and zones
Date: Mon, 21 Apr 2003 14:27:34 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304211426510.16203-100000@wookie.shorewall.net>
References: <Pine.LNX.4.44.0304191340000.28238-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304191340000.28238-100000@dell>
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
To: Netfilter Users List <netfilter@lists.netfilter.org>

On Sat, 19 Apr 2003, Robert P. J. Day wrote:

>   however, it *appears* (and i stress "appears") that zones
> are defined as being what lives beyond an interface, and you can't
> get more detailed than that.
>

That's not correct.
 
>   in a single host case, there would be two zones -- out there
> ("net"), and "fw", the host itself (the host always being considered
> the "fw" zone).  but this doesn't seem to be sufficient for what
> i'm trying to do.
> 

Check out the documentation for the /etc/shorewall/hosts file.

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
Shoreline,     \ http://www.shorewall.net
Washington USA  \ teastep@shorewall.net


