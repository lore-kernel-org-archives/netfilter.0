From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Logging question
Date: Wed, 9 Feb 2005 10:35:44 -0500 (EST)
Message-ID: <3144.142.169.215.10.1107963344.squirrel@142.169.215.10>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8KAAAAQAAAA2SDxWNDfuEmRY16FU7zNcwEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8
	KAAAAQAAAA2SDxWNDfuEmRY16FU7zNcwEAAAAA@rogers.com>
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
To: dave beach <drbeach@rogers.com>
Cc: netfilter@lists.netfilter.org

On Wed, February 9, 2005 9:08 am, dave beach said:

Hi dave!

> [...]
> Without posting my entire iptables script, I guess I have several gener=
al
> questions:
>
> 1) Can the "flow" diagram in section 3.1 of Oskar's tutorial be relied
> upon?
> I would have thought so, and it has seemed reliable in practice, but th=
e
> failure of this one logging rule is now making me doubt that.

At some point, the diagram is right. There's just one thing missing and I
think that's where you got stuck.

There's an invisible hook called conntrack which happens right before NAT
table. See answer below...

>
> 2) Under what circumstances would packets not traverse the nat/POSTROUT=
ING
> chain, as hinted at by Oskar in the tutorial?

Here's a good one from this same tutorial. Let me bring you to
section 3.3:

"Note that, as we have said before, only the first packet in a stream wil=
l
hit this chain. After this, the rest of the packets will automatically
have the same action taken on them as the first packet."

That means, every packets that are NEW to the conntrack will get through
NAT table. Subsequent packet won't pass thru because it's useless and may
lead to inconsistency. Let's say you have a flow of data in progress, you
DNAT'ed that flow up to some host into your LAN. If you change the DNAT
rule while there's a current flow using it, that won't affect the flow
"in progress".

As long as the entry (called tuple here) belongs to the conntrack, there
won't be any other (NAT) action taken on it.

>
> 3) Where would be a more appropriate place to put a ulog rule to captur=
e
> details of all outbound packets on eth0, and why would that not be the
> same
> place as one to capture details of all outbound packets on eth1? I susp=
ect
> the answer to this is intimately related to the answers to 1 and 2 abov=
e.

The POSTROUTING hook from the _mangle_ table is appropriate. This one
is always concerned.

>
> Any help would be appreciated; I can post my iptables script if it woul=
d
> be
> useful.

HTH,
Samuel



