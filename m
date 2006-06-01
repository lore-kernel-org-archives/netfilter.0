From: "Horton, Dave" <dhorton@pactolus.com>
Subject: NFC_ALTERED packet for localhost not being re-routed
Date: Thu, 1 Jun 2006 10:31:38 -0400
Message-ID: <E8E029BA163C694484CFEA4914619EA201285554@pcsexch.ad.pactolus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

I have a netfilter target which is hooking on to the PRE_ROUTING chain.
My target is doing some simple packet forwarding.  My code modifies the
IP and UDP destination address and port, and sets the NFC_ALTERED bit.
This works perfectly when I set the destination address to a different
machine -- the packet gets re-routed and forwarded on to the machine as
I want it to.

However, I also have a special case where I am leaving the destination
address as the local address and only rewriting the destination port in
the UDP header.  I also set the NFC_ALTERED bit in this scenario.  What
I want to happen in this case is for the packet gets rerouted, as in the
above scenario -- I want it to come back in on the PRE_ROUTING chain
again on the local machine, this time with the modified destination UDP
port.  However, this is not what happens -- it appears that the packet
doesn't get rerouted if it has a local address as the destination
address in the ip header.  (If I do a tcpdump I only see the packet
once, as it comes out of me target.  When I am forwarding to remote
addresses I will see the packet twice in the capture - once as it comes
out of my PRE_ROUTING hook, and once after its rerouted, as its being
sent.)

Is there a way I can get it to do what I want, either by configuration
or a code change of some kind?

I am running RH ES 3.0 with kernel version 2.4.21-27.EL

