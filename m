From: Ernest Davnis <mark@renton.name>
Subject: Re: -m owner and INPUT chain
Date: Fri, 1 Jun 2007 11:22:02 +0400
Message-ID: <20070601072202.GA36920@diabolo.evga.ru>
References: <20070528174650.GA50672@diabolo.evga.ru>
	<465B2A25.7030502@intrace.com.br>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <465B2A25.7030502@intrace.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Fernando R. Durso" <fernando@intrace.com.br>
Cc: netfilter@lists.netfilter.org

On Mon, May 28, 2007 at 04:14:45PM -0300, Fernando R. Durso wrote:
> Have you tried "iptables -D OUTPUT -o lo -m owner --uid-owner 500 -p all 
> -j ACCEPT" ????
> I mean specifying the output interface as lo with -o lo ????

Sorry, I mistyped.
Of cause you need to use -A.

The problem with the input traff is still not solved. Do you have any
ideas? Thanks.

 
> Ernest Davnis escreveu:
> >Hi,
> >
> >I've got a problem which i can't solve with the help of Linux. The
> >problem is such:
> >there's a server with many shell accounts, i have to check what
> >incoming/outcoming traffic generate these users.
> >No problem with outgoing traff:
> >
> >iptables -D OUTPUT -m owner --uid-owner 500 -p all -j ACCEPT
> >but it's said in man iptables:
> >
> >owner
> >This module attempts to match various characteristics of the
> >packet creator,  for  locally-generated  packets.
> >It  is  only  valid  in the OUTPUT chain, and even this
> >some packets (such as ICMP ping responses) may have no
> >owner, and hence never match.
> >
> >It means that I can't use owner module for INPUT chain
> >I've also found a patch:
> >http://svn.netfilter.org/cgi-bin/viewcvs.cgi/branches/patch-o-matic-ng/linux-2.6.11/owner-socketlookup/
> >but i can't make it work on linux kernel 2.6.20+, as there's a
> >difference in tcp.h, udp.h and etc or anything else that
> >I don't know.
> >
> >Using FreeBSD to solve such a problem is the following:
> ># ipfw add ip from any to me in uid 500
> ># ipfw add ip from me to any out uid 500
> >
> >Can I make smth similar on Linux?
> >
> >  

-- 
BRGDS. Ernest Davnis.

