From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: DNS Manipulation via IPTables?
Date: Wed, 08 Nov 2006 16:00:16 -0600
Message-ID: <45525370.3050807@riverviewtech.net>
References: <9685603FA2D84E48A85D428D36ED23332BEEB8@clavin.kintera.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9685603FA2D84E48A85D428D36ED23332BEEB8@clavin.kintera.int>
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

Dan Bogda wrote:
> Guys,
> I'm looking to see if an IPTables solution exists for NATing DNS
> responses? I am already using multiple views within Bind to address this
> and I would like to find a way to alter just the records I need, rather
> than deploy duplicate zones. I thought I could alter DNS responses with
> IPTables, but I can't find any reference to this. Does this
> functionality exist natively or via a plug-in module or not at all?

I think you could use the layer 7 match extension to match the packets, but
I don't know of a way that you could alter them, sort of using netlink to
send the packet to user space (if I have my terms correct).



Grant. . . .


