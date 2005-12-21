From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ICMP types to allow
Date: Wed, 21 Dec 2005 17:01:01 -0500
Message-ID: <1135202461.30754.38.camel@siren.chrisbrenton.org>
References: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
	<1135192930.4872.4.camel@anduril.intranet.cartel-securite.net>
Reply-To: cbrenton@chrisbrenton.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1135192930.4872.4.camel@anduril.intranet.cartel-securite.net>
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

On Wed, 2005-12-21 at 20:22 +0100, Cedric Blancher wrote:
>
> In addition to this, Netfilter, unlike some popular proprietary
> products, provide a proper stateful ICMP filtering. Just use it. Valid
> ICMP errors will fall into RELATED state, others will be INVALID.

Agreed. The payload on ICMP errors (which contains 28 bytes of the
packet which generated the error) is inspected and compared against the
state entry. This mean RELATED is more than capable of letting through
needed ICMP errors and dropping the bogus stuff. So you are cool with
types 3,4,5, & 11. The average perimeter does not need much more than
that.

For a while there AIX was using 1500 byte type 8's for MTU path
discovery instead of setting the DF flag in it's packets. They stopped
this by default a few years back however (although the operator still
has the option of turning this brain dead feature back on). So this may
be an exception if you are dealing with these systems.

Someone already mentioned the other condition which is permitting type
8's between Windows AD systems. Obviously you should only do this if you
need to and the range of permitted source IP's should be as restrictive
as possible.

HTH,
Chris



