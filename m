From: Tib <tib@tigerknight.org>
Subject: Re: Hi!
Date: Sun, 12 Jun 2005 20:09:54 -0500 (CDT)
Message-ID: <Pine.LNX.4.53.0506121953590.9775@altaica>
References: <2e51be410506111000557ddca1@mail.gmail.com>
	<Pine.LNX.4.53.0506111202260.9775@altaica>
	<1118512593.18567.6.camel@debianbox>
	<Pine.LNX.4.53.0506111321350.9775@altaica>
	<1118620090l.11527l.0l@server.moose.blogdns.org>
	<Pine.LNX.4.53.0506121914140.9775@altaica>
	<1118623895l.11527l.1l@server.moose.blogdns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118623895l.11527l.1l@server.moose.blogdns.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, 13 Jun 2005, Ian Laurie wrote:
> We *may* be speaking at cross purposes.  I agree with what you have said but
> I am also correct.  The issue is your statement "hits the firewall and falls
> flat".
>
> Your original paragraph doesn't make it clear to a beginner that you are
> pre-supposing that there is a real firewall in place that will enforce NAT.
>
> My point, that is also 100% correct, is that having a NAT rule alone does
> not disable the bridging function.
>
> The reality is that a lot of beginners "assume" that when they have NAT, their
> internal addresses are unreachable from the outside and that simply isn't
> the case with NAT alone (at least not with iptables under Linux).
>
> That was the point I was making.

The original question was regarding a person with 3 ip's and the best way
to make use of them on a network with a gateway host and two other hosts
that would be behind it.

I would be curious to hear how you can communicate to internal networks
from across the internet without knowledge of the ip-block being used on
said network behind a masqueraded host, and without the gateway/firewall
box using iptables being explicitly instructed to route traffic that it
receives on an external interface to the internal network - and have it
get back out properly. I have never known or seen such a thing to be
possible.

> As for the rest of your post, you are forgetting the wider purpose of
> routers/firewalls.  For example, inside a company where you may have the
> R&D department on one private address space, finance on another, etc., all
> isolated with routers.  In this scenario (which I work in) all you need to do
> is use the "route" command to tell your machine where to send packets, and
> suddenly private IP addresses are routable and *will* make it to the
> firewall.  Further, you can specifically allow certain machines (like mine)
> to get through..... despite NAT in operation for all other packets.
>
> That is, I can ssh etc. into boxes that sit behind NAT.  I just wanted to
> make the point that NAT alone doesn't prevent this, which wasn't obvious
> from your post.

But see - your work network (and mine as well) is designed explicitly to
enable traffic like that to flow between different physical segments. But
as we both just said - those are work networks that are designed with
dozens if not hudreds or thousands of hosts involved, and typically it is
the nat that specificly enables such things to happen. And again - anyone
without specific knowledge to the architecture of the system is going to
be guessing in the dark and have little to no chance of initiating proper
communication, forcing them to resort to disruption tactics like I
mentioned in situation #2 previously.

The general internet at large is not designed to route or respond to
private network traffic, if it did things would be very messy indeed on
the net.

So while such things /are/ possible in specific, explicit, application -
for the general newbie end-user as you put it, the setup I defined being
short, simple, and uncomplicated is going to both service and protect the
hosts involved as well as provide maximum flexibility for those hosts as
well.

I don't think we're talking at cross purposes really. We're both on target
but just in different frames of reference for the practical application of
networking involved.

<EOL>
Tib

