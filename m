From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables + squid
Date: Sun, 26 Sep 2004 10:27:11 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096208831.16814.22.camel@wolfpack.ljm.dom>
References: <web-453410391@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-453410391@mail01.infosat.net>
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
To: netfilter@lists.netfilter.org

On Sun, 2004-09-26 at 01:35, it clown wrote:
> Hi All,
> 
> I want to run squid on the same box as iptables.I need to
> setup the client pc's that they have to go through the
> proxy to get to the internet... port 3128.They must not be
> able to by pass the proxy to get internet access.What rule
> do i need to add to iptables to only allow squid to have
> internet access?
> 
> I want to give the clients internet access through squid,
> thanks.
> 
> Regards
> _____________________________________________________________________
> For super low premiums ,click here http://www.dialdirect.co.za/quote

# allow clients to connect to squid proxy
iptables -A INPUT -i $INSIDE_IF -p tcp --syn --dport 3128 -j ACCEPT

# allow squid to fetch web content
iptables -A OUTPUT -o $OUTSIDE_IF -p tcp --syn --dport 80 -j ACCEPT

of course--this assumes that you do not allow clients through the
FORWARD chain on port 80.

-j

disclaimer:  the rules contained in this message are meant to illustrate
the requested functionality only, and not intended as a recommendation
of best practices.  never execute any commands without fully
understanding the implications.

-- 
Jason Opperisano <opie@817west.com>


