From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Leaking ICMP and UDP packets
Date: Tue, 20 Apr 2004 19:37:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201937.20176.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0404201059380.9758-100000@dudester.spoontail.com>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0404201059380.9758-100000@dudester.spoontail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 20 April 2004 7:06 pm, Daniel David Benson wrote:

> Ok, so if I understand correctly, the 10.101.10.103 host is trying to
> respond to this windows box -- it only knows the default gateway to get to
> that 169 address.

Yes, and the default gateway (your firewall) only knows its external interface 
to send out packets which don't belong to the internal LAN/s.

>  It doesn't NAT because it doesn't have a corresponding
> "initiated" NAT entry?  I guess I'm confused as to why it doesn't match
> the global NAT entry -- I suspect it's my lack of understanding of how NAT
> is implemented.

Hm, actually, yes, you have a point there - you do have a generic SNAT rule 
which should apply to any packets leaving the external interface.   I don't 
have an answer for that one right now.

>  In the end, I should be blocking these 169 requests in
> the FORWARD table anyway.

Yes, that would be a good plan.

> Is it common practice to set the NAT chains default policies to DROP?

NO!!!!   *Never* set a nat table (or a mangle table) to have any default 
policy other than ACCEPT.

Think really *really* hard before using a rule with a DROP target in the nat 
or mangle tables (it can be valid sometimes, but make sure know what it will 
do before you use it).

>  I guess, I'd like to know the best way to stop these bad boys from getting
> out to be a good netizen.

Well, I wouldn't worry about it too much - an upstream ISP will drop them soon 
enough with that destination address.

If you do want to drop them yourself, however, start with the addresses listed 
in http://www.rfc-editor.org/rfc/rfc3330.txt and block anything entering or 
leaving your network with a source or destination address in these ranges.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


