From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: Kaaza 2 jammer.
Date: Thu, 9 Jan 2003 12:58:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPGENAEKAA.netfilter@darrelldieringer.com>
References: <565759501.20030109180351@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <565759501.20030109180351@wp.pl>
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
To: netfilter@lists.samba.org

I've always wondered something about the string matching, but never
having used it, I haven't researched it enough to know...

Wouldn't netfilter also see the string "KazzaClient" in this email
message?  I can imagine how that might cause problems if the string
matching rules aren't well crafted.

I see in the example posted by Tomasz Wrona that it only applies to
tcp packets forwared from the internal interface, narrowing the focus
qiute a bit.  But wouldn't that also block an email message having
that string if sent from an internal machine?

Of course, the sender of that message may have indeed sent it from a
client on his internal network, and since I'm reading it, it must have
worked as intended.

I imagine placing a string matching rule, like the example, _after_
rules which accept other legitimate traffic (like smtp) would work
completely fine.

Looking for eduction on the topic.

Darrell Dieringer - Madison, WI

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
> Tomasz Wrona
> Sent: Thursday, January 09, 2003 11:04 AM
> To: netfilter@lists.samba.org
> Cc: lartc@mailman.ds9a.nl
> Subject: Kaaza 2 jammer.
>
>
> Hello,
>
> Some people asked about matching [blocking] Kaaza 2 sessions.
> So try this simple rule:
>
> iptables -I FORWARD -i $internal_interface -p tcp -m string
> --string "KazaaClient" -j REJECT --reject-with tcp-reset
> [Or maybe worth to try -j TARPIT]
>
> In above rule I don't specify separate ports due to dynamic
> port allocation.
> This rule works fine, catches and reset completly Kaaza 1 and 2
> versions.
>
>
> Regards,
> tw


