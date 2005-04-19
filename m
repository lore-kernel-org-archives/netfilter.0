From: Jason Opperisano <opie@817west.com>
Subject: Re: UDP nat question
Date: Tue, 19 Apr 2005 08:03:15 -0400
Message-ID: <20050419120315.GA19248@bender.817west.com>
References: <4263C3A2.70006@inescporto.pt>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4263C3A2.70006@inescporto.pt>
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
To: netfilter@lists.netfilter.org

On Mon, Apr 18, 2005 at 03:26:42PM +0100, Filipe Abrantes wrote:
> Hi all,
> 
> I have a basic question about iptables UDP NAT.
> 
> Imagine that you have 2 UDP sessions in your private LAN using the same 
> port. How does iptables nat these connections? One of the sessions will 
> get one external port of the NAT machine and the other session will get 
> another one? Does the usual MASQUERADE command suffice to achieve this?

if you're talking about two machines in the inside network making
outbound connections to the same UDP port; for example 53, then (a) it's
highly unlikely that both connections will use the same source port and
(b) yes--each machine gets its srcip:sport re-mapped to the iptables
machine's pubip:mappedsrcport.  remember that connection-tracking uses
four values to match a connection:

  src ip, src port, dst ip, dst port

> iptables MASQUERADE command:
> 
> $IPTABLES -t nat -A POSTROUTING -o $OUTBOUND_IFACE -j MASQUERADE

sure.

> Hope I have made myself clear and,

not really--because i'm guessing your actual question is about something
infinitely more complicated that will come out after much dancing
around...maybe i'm wrong.

-j

--
"Lois: Peter, there's a naked man on this cake.
 Peter: There were only two cakes left, and trust me, you do not want
 the one of Al Roker with the Hershey Kiss nipples."
        --Family Guy

