From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: UDP DNAT help
Date: Tue, 8 Apr 2003 00:40:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304080040.31730.netfilter@newkirk.us>
References: <007f01c2fd77$39578dd0$0b19a8c0@rock1>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007f01c2fd77$39578dd0$0b19a8c0@rock1>
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
To: Craig Packard <cpackard@zoominternet.net>, netfilter@lists.netfilter.org

On Monday 07 April 2003 10:31 pm, Craig Packard wrote:
> **********Original Post***********
>
> From what I understand if I setup a DNAT rule, when a packet matching
> the rule comes in it is sent to the specified host, obviously this is
> done by changing the destination field to be the system 'behind' the
> firewall.  It was however my understanding--and what I've seen in
> practice--that the source field would not be changed.  So in other
> words the source of the packet would still be the host out on the
> internet that actually sent the original packet.  However I have made
> a set of DNAT rules that I couldn't get to work. So a setup a packet
> sniffer at several points.  Here is what I noticed and has me
> confused.
>
>
> The inside computer (A) sends out a UDP packet to the internet
> connected computer (B), of course this packet goes through firewall
> (FW).
>
> The packet goes out as expect srcA dstB
> But the weird part is the response comes back in srcFW dst(A)   Where
> I would like it would be src(B) dst(A)!!!
>
> I think this is screwing up the communications.  Can anyone help me
> understand what is happening?
>
> -    Craig

Sounds like a SNAT rule that isn't tied down to just the external=20
interface.  Including packet traces and sniffs is potentially useful,=20
but more useful would be any SNAT and DNAT rules themselves.

j


