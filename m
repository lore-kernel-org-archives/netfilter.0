From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: newbie question - what is the iptables equivalent of a Linksys
	"DMZ" ?
Date: Sun, 14 Nov 2004 08:35:02 -0500
Message-ID: <876ef97a041114053543dfe394@mail.gmail.com>
References: <1100392955.4894.25.camel@localhost.localdomain>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100392955.4894.25.camel@localhost.localdomain>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 13 Nov 2004 19:42:35 -0500, David Williamson
<nospam1@nullcutter.com> wrote:
> There's a feature on the Linksys box, however, that I can't figure out
> how to implement, because I don't know how it worked on the Linksys box,
> and that is the DMZ function.  When a machine behind the router was
> going to serve as a, for example, game server (like Unreal Tournament
> 2004), the only way I could get it to work was to put that particular IP
> on the DMZ, which, I gather, meant that it looked like it was right on
> the net, unprotected, unrouted, unmasqed, et cetera.

If:

INTINT=<the interface from which packets from the outside come into
your local network>, and you want to DMZ 192.168.1.100...

Then:

# iptables -A FORWARD -o $INTINT -d 192.168.1.100 -j ACCEPT

That's all. Just accepting everything destined for the DMZ is good
enough to make it the DMZ. Repeat as necessary.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

