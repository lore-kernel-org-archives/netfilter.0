From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 15:49:21 -0400
Message-ID: <1113248961.2151.12.camel@grendel>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, 2005-04-11 at 15:18, Christian Seberino wrote:
>
> I think RFC 793 requires TCP stacks to send RSTs if they
> get packets not meant for them in some cases.  Anyone know which
> cases?

Pretty much all. The exceptions I can think of off the top of my head:
In response to a RST
In response to a FIN to an open port (MS returns a RST/ACK)

> For example, I think closed ports must send RSTs if they
> get stuff.

Agreed.

> Even if YES, it seems a firewall could drop any RSTs that
> don't have ACK set without damage right?

The only condition I can think of off the top of my head that will
return a RST instead of a RST/ACK is in response to an unsolicited ACK
sent to either an open or closed port. So they do happen in the wild.

HTH,
Chris






