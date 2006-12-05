From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: NAT & Multihoming Problem
Date: Tue, 05 Dec 2006 09:25:02 -0600
Message-ID: <45758F4E.7010607@riverviewtech.net>
References: <117F5E7DA31C17478948DC39E01B948B400F1F@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <117F5E7DA31C17478948DC39E01B948B400F1F@frost.PlumSoftwareLtd.local>
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

On 12/04/06 11:15, Matt wrote:
> I hope someone can help - or at least tell me whether what I'm trying to do is possible!
> 
> I have set up a linux box with 3 NICs, two external public IPs and one internal private IP. I set up the multihoming as per section 4.2 of the Advanced Routing HowTo. This seems to work OK without trying to do any NAT. (I've successfully pinged each public IP from a dial up connection on a laptop whilst the cable for the other NIC is disconnected)
> 
> Things don't work when I try to add NAT to the picture. I want to do port forwarding on both public IPs to a single private IP. Is this possible at all?

I don't know for sure that this is all of your problem or not.  However one
thing that I do see is that you have a policy of DROP for your filter:INPUT
chain.  You do have a statefull rule to allow related / established traffic
in.  However, you do not appear to have any rules to allow new inbound traffic.

> What am I doing wrong? Or am I trying to do something impossible?



Grant. . . .

P.S.  Message was resent to the mailing list for all to see.

