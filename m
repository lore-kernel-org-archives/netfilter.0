From: "it clown" <suse@mailbox.co.za>
Subject: Re: irc+iptables
Date: Sat, 02 Oct 2004 19:32:35 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-460830972@mail01.infosat.net>
References: <1096717884.22962.69.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096717884.22962.69.camel@wolfpack.ljm.dom>
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

Sorry i ment port 6667 and not port 80 in the nat. I just
throught that because in isa server you can connect to irc
through it you could do the same with squid.

On Sat, 02 Oct 2004 07:51:25 -0400
 Jason Opperisano <opie@817west.com> wrote:
> On Sat, 2004-10-02 at 05:03, it clown wrote:
> > Hi All,
> > 
> > i am having some trouble in getting irc working through
> > iptables and squid.When i put a forwarder in my
> iptables
> > rule i can connect to irc but when i want to go through
> the
> > proxy i have no luck.I have loaded the ip_nat_irc and
> > tried:
> > 
> > -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT
> > --to-ports 3128.
> 
> which is a nat rule redirecting tcp port 80 traffic to
> your squid cache
> running on tcp port 3128.
> 
> > I have made the changes in squid to allown port 6667.
> > Port 6667 is allowed OUT.
> 
> what has has led you to believe that squid can proxy IRC
> traffic?  i may
> be out of the loop, but AFAIK, squid supports proxying
> for:  HTTP,
> HTTPS, FTP, Gopher, and WAIS.
> 
> even if it did support proxying for IRC, you're only
> redirecting port
> 80.
> 
> for IRC, you'll need to use a forward rule along the
> lines of:
> 
>   iptables -A FORWARD -i $INSIDE_IF -p tcp --syn --dport
> 6667 -j ACCEPT
> 
> HTH...
> 
> -j
> 
> disclaimer:  the rules contained in this message are
> meant to illustrate
> the requested functionality only, and not intended as a
> recommendation
> of best practices.  never execute any commands without
> fully
> understanding the implications.
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 

_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote

