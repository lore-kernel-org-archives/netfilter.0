From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: matching the first packet of a connection
Date: Wed, 04 May 2005 16:36:47 -0500
Message-ID: <4279406F.1030703@riverviewtech.net>
References: <1115220105.26791.25.camel@localhost.localdomain>	
	<4279248D.9090903@riverviewtech.net>
	<1115241663.5410.18.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115241663.5410.18.camel@porky>
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
To: netfilter@lists.netfilter.org

> In the scope of the NuFW project we need to queue SYN packets for
> connection we want to authenticate (see http://www.nufw.org/ for details
> on principles). For a single connection we want to QUEUE only the first
> packet coming to the firewall (SYN packet in the case of TCP). All
> subsequent packets of the connection even if they are also SYN packet
> (if for example server is unreachable or does not exist) have to me
> authorized or drop depending of the decision taken on the first packet.
> In fact this is an extension of the ESTABLISHED or RELATED match.

I'm not quite sure how to "queue" packets as take them in to some sort of FIFO with a pause but possibly you do and you just need help matching which packets to queue.  I know with the recent match extension you could probably ""remember a connection attempt (how to remember for just that connection is a question in and of it's self though (working on this)) and queue the first one and then take some sort of action on subsequent based on how the packets are dequeued.  I think you are going to need to rely on some sort of external input, possibly via the condition match extension.  I've seen and briefly read about NuFU but I need to do so again to get up to speed to help with this.  Let me go do some reading and I'll get back to you.



Grant. . . .

