From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridge, DNAT, New Tables and ip rules
Date: Mon, 11 Jun 2007 19:31:21 -0500
Message-ID: <466DE959.8020609@riverviewtech.net>
References: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/11/2007 5:35 PM, semi linux wrote:
> I've got a rather elaborate setup here that doesn't seem to be 
> working for me and I was hoping someone here might be able to shed 
> some light on the problem.

Will you please clarify, has this set up worked for you in the past and 
something has now changed?  Or are you trying to make it work for the 
first time?

> My server (Jose) is a bridged link between two hosts (Jack and Dan). 
> Jack's messages are NATed to the local bridge interface and then the 
> local interface will talk to Dan.  The trick here is that I never 
> know Jack's IP - only Dan's and software on Jose acts as an 
> intermediary.  This has worked fine for quite a while, without 
> problem using the following rules:

It sounds like (I'm guessing) that eth0 and eth1 are bridged together 
and have an bridge interface of br0.  Correct?

Are you wanting to DNAT any traffic (originally) going to Dan to the 
bridge IP?  In other words any traffic that was going to Dan DNAT it to 
the bridge IP where software running on the bridge will talk to Dan as a 
proxy (of sorts)?  To pull this off you have to match based on Dan's 
destination IP correct?

Do you want to DNAT any other traffic flowing through the bridge?  Is 
there any other traffic flowing through the bridge?

> iptables --append PREROUTING -t nat -d $DANS_IP -p tcp --dport 
> $DEST_PORT -j DNAT --to-destination $BRIDGE_IP:$DEST_PORT
> 
> iptables --append PREROUTING -t nat -s $DANS_IP -p tcp --sport 
> $DEST_PORT -j DNAT --to-destination $BRIDGE_IP

Depending on how your application is set up, I'm worried that your last 
rule could accidentally match the traffic that the application is trying 
to send back to the world thus causing the traffic to loop back in to 
the application.  Will you please help clarify this?

> It's an odd setup, I know, but it works.

I can sort of see how you would be doing this.  I'm just not sure why. 
But the why is immaterial.

> The problem comes-in when adding a new network card to my server. 
> Depending on network address, if eth0 ever has a connection problem, 
> Jack talks to Jose, Jose to Dan and Dan to Jose, but Jose back to 
> Jack never works.  It always trys to use eth0 for that communication. 
> The packets out of eth0 have SRC=Dan and DEST=Jack.  The weird thing 
> is, I don't see these packets on the Jose<->Dan link... only coming 
> out of eth0.  How can I route them out BR0 instead of eth0?

I think this supports what I was worried above, but I'm not sure.

Is Jose's IP address bound to eth0 or br0?

> I've tried marking the packets using mangle, sending them to a 
> different routing table but it doesn't seem to have any effect.

I don't think marking is needed here, but I may be wrong.

> In this setup, we want to use eth0 for _everything_ except the 
> traffic we DNAT.  If eth0 is brought down, br0 should be used as a 
> backup.

What interfaces are in br0 again?  You are also talking about adding 
NIC(s) to (I think) Jose.  When you do add NIC(s) are your existing 
interfaces getting their assignment bumped down, or is the new NIC going 
on the end of the list?

> Any suggestions, hint, tips, etc?

I feel like (rapid) spanning tree is going to be your friend.  What are 
you wanting to add the NIC(s) for?  Are you wanting to add NICs eth2 and 
eth3 so that eth0 and eth2 face Jack and eth1 and eth3 face Dam?  (Note: 
  I just chose to pair eth0 / eth2 and eth1 / eth3 together so that eth0 
and eth1 face what they were facing previously, just add more on the 
top.)  If this is indeed correct, I would recommend that you use (R)STP 
to control which links of eth0 / eth2 and eth1 / eth3 are in a blocking 
and forwarding state.  If your IP is bound to br0 STP should put eth2 
and eth3 in to blocking state and use eth0 and eth1 to carry the 
traffic.  If for some reason either of the links goes down, (R)STP 
should  realize this and transition the corresponding link to the one 
that went down in to forwarding state thus allowing traffic to continue 
flowing.

If you do not want to do this with (R)STP, you probably should look in 
to bonding eth0 / eth2 and eth1 / eth3 in to two separate bond0 and 
bond1 interfaces.  Depending on how bonding is set up, you can use load 
balancing for increased bandwidth, or pure fail over.

> I've followed Chapter 11 of the LARTC Howto without any luck.

(Like above, I don't think marking has a lot to do with this.)



Grant. . . .

