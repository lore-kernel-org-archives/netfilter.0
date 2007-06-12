From: "semi linux" <linuxsemi@gmail.com>
Subject: Re: Bridge, DNAT, New Tables and ip rules
Date: Tue, 12 Jun 2007 12:12:03 -0700
Message-ID: <e53321d30706121212r3dabccb2na62e2c07c2b3902b@mail.gmail.com>
References: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>
	<466DE959.8020609@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=iJ4INJf1Cm8w374mMQYLI+WOErLHlVa7VSFiQxT2JRq/MKcRUYrjh+K+AT9ySqODZtr/RFRZXOHWDqDUcAqQBU+4cUZqQCE2OO37ygNUEBUnl2No2nhOt9nE0JHbV+RA5q684wm+A/ovKFOscBU4jXY41VEMCVXIo5Dh/YgH+D0=
In-Reply-To: <466DE959.8020609@riverviewtech.net>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/11/07, Grant Taylor, wrote:
> On 6/11/2007 5:35 PM, semi linux wrote:
> > I've got a rather elaborate setup here that doesn't seem to be
> > working for me and I was hoping someone here might be able to shed
> > some light on the problem.
>
> Will you please clarify, has this set up worked for you in the past and
> something has now changed?  Or are you trying to make it work for the
> first time?

Yes, I've had this setup running for quite a while but when adding a
new ethernet card (on the same or different networks) I get a problem.

> > My server (Jose) is a bridged link between two hosts (Jack and Dan).
> > Jack's messages are NATed to the local bridge interface and then the
> > local interface will talk to Dan.  The trick here is that I never
> > know Jack's IP - only Dan's and software on Jose acts as an
> > intermediary.  This has worked fine for quite a while, without
> > problem using the following rules:
>
> It sounds like (I'm guessing) that eth0 and eth1 are bridged together
> and have an bridge interface of br0.  Correct?

Actually, I've renamed two ports on a dual-port card to be eth50 and
eth51 (done using udev rules) and they have a bridge interface of br0.

> Are you wanting to DNAT any traffic (originally) going to Dan to the
> bridge IP?  In other words any traffic that was going to Dan DNAT it to
> the bridge IP where software running on the bridge will talk to Dan as a
> proxy (of sorts)?  To pull this off you have to match based on Dan's
> destination IP correct?

Spot-on.  My intermediary software is designed to traffic destined for
Dan on a given port.  That traffic hits the bridge and is NATed to the
local (br0) IP address and port.  It's a DNAT rewriting the
destination IP and port if the incoming message is from Jack.  If the
message is from Dan, it only rewrites the destination IP.

> Do you want to DNAT any other traffic flowing through the bridge?  Is
> there any other traffic flowing through the bridge?

All other traffic flows just like normal through the bridge.

> > iptables --append PREROUTING -t nat -d $DANS_IP -p tcp --dport
> > $DEST_PORT -j DNAT --to-destination $BRIDGE_IP:$DEST_PORT
> >
> > iptables --append PREROUTING -t nat -s $DANS_IP -p tcp --sport
> > $DEST_PORT -j DNAT --to-destination $BRIDGE_IP
>
> Depending on how your application is set up, I'm worried that your last
> rule could accidentally match the traffic that the application is trying
> to send back to the world thus causing the traffic to loop back in to
> the application.  Will you please help clarify this?

The second rule is in place just in case Dan initiates conversation,
instead of Jack.  When the source is local, wouldn't the outgoing
traffic be processed as follows?:

program -> routing decision -> mangle::output, nat::output,
filter::output, mangle::postrouting, nat::postrouting, interface,
wire.

Therefore it'd never hit the nat::prerouting (or _any_ ::prerouting
rules), right?

> > It's an odd setup, I know, but it works.
>
> I can sort of see how you would be doing this.  I'm just not sure why.
> But the why is immaterial.

Yeah, and trust me, you don't want to go there... if you think this is
odd, the reasons are doubly-so.

> > The problem comes-in when adding a new network card to my server.
> > Depending on network address, if eth0 ever has a connection problem,
> > Jack talks to Jose, Jose to Dan and Dan to Jose, but Jose back to
> > Jack never works.  It always trys to use eth0 for that communication.
> > The packets out of eth0 have SRC=Dan and DEST=Jack.  The weird thing
> > is, I don't see these packets on the Jose<->Dan link... only coming
> > out of eth0.  How can I route them out BR0 instead of eth0?
>
> I think this supports what I was worried above, but I'm not sure.
>
> Is Jose's IP address bound to eth0 or br0?

Jose has two IP address, eth0 and br0... they could be on the same
subnet or different subnets (depending on install details).

This is the crux of the problem, let me try to clarify... Jose does
talk to Jack, but it's through the wrong interface (eth0 instead of
br0 (eth50/eth51)).  The packets that are coming out of eth0 are the
proper responses, with Dan is listed as the source and Jack is the
destination.  The question is, w/o knowing Jack's IP how do I route
them through br0?

> > I've tried marking the packets using mangle, sending them to a
> > different routing table but it doesn't seem to have any effect.
>
> I don't think marking is needed here, but I may be wrong.

I was pointed in that direction by the good folks over on the Fedora
mailing list but I'm all ears to try anything here and have no problem
testing _sny_ suggestions.

> > In this setup, we want to use eth0 for _everything_ except the
> > traffic we DNAT.  If eth0 is brought down, br0 should be used as a
> > backup.
>
> What interfaces are in br0 again?  You are also talking about adding
> NIC(s) to (I think) Jose.  When you do add NIC(s) are your existing
> interfaces getting their assignment bumped down, or is the new NIC going
> on the end of the list?

br0 - eth50/51 - bridged.
eth0,1,2,3,etc... independent.
New NIC are brought-up in a typical fashion... added, with default gateway, etc.

> > Any suggestions, hint, tips, etc?
>
> I feel like (rapid) spanning tree is going to be your friend.  What are
> you wanting to add the NIC(s) for?  Are you wanting to add NICs eth2 and
> eth3 so that eth0 and eth2 face Jack and eth1 and eth3 face Dam?  (Note:
>   I just chose to pair eth0 / eth2 and eth1 / eth3 together so that eth0
> and eth1 face what they were facing previously, just add more on the
> top.)  If this is indeed correct, I would recommend that you use (R)STP
> to control which links of eth0 / eth2 and eth1 / eth3 are in a blocking
> and forwarding state.  If your IP is bound to br0 STP should put eth2
> and eth3 in to blocking state and use eth0 and eth1 to carry the
> traffic.  If for some reason either of the links goes down, (R)STP
> should  realize this and transition the corresponding link to the one
> that went down in to forwarding state thus allowing traffic to continue
> flowing.
>
> If you do not want to do this with (R)STP, you probably should look in
> to bonding eth0 / eth2 and eth1 / eth3 in to two separate bond0 and
> bond1 interfaces.  Depending on how bonding is set up, you can use load
> balancing for increased bandwidth, or pure fail over.
>
> > I've followed Chapter 11 of the LARTC Howto without any luck.

I'm guess with the information I've provided above, you're going to
suggest something different... I've already looked into bonding and
STP... even adding eth0 to the bridge, none of those solutions seem to
do the trick.  Let me know if I should reconsider some of these in
light of the above.

- Gareth

