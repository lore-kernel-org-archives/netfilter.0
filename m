From: Jason Opperisano <opie@817west.com>
Subject: Re: preserving fwmarks through KLIPS
Date: Tue, 11 Jan 2005 07:45:15 -0500
Message-ID: <1105447514.9691.9.camel@hubcap.ljm.dom>
References: <1105393017.12167.24.camel@latte.nssg.mitel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105393017.12167.24.camel@latte.nssg.mitel.com>
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

On Mon, 2005-01-10 at 16:36, Michael P. Soulier wrote:
> Hello,
> 
> I am trying to classify ipsec and non-ipsec traffic on the external
> interface of my box. I plan to use fwmarks in iptables, and then rely on
> those for queueing classification on the external interface. 
> 
> My question is, if I mark a packet before it is encrypted by KLIPS in
> FreeS/WAN, when it is re-injected with a new IP header, will that fwmark
> be maintained? 

nothing can replace you actually testing this for yourself, but yes--in
my experience--MARKs stay with a packet through its entire journey
through the stack, regardless of what sort of processing is done to the
packet.  a MARK is simply tag associated with a packet, but not part of
the packet itself.

-j

--
"I have been shot eight times this year, and as a result, I almost
 missed work."
	--The Simpsons


