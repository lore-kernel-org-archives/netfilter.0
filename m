From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: ESP does not hit the nat table
Date: Sun, 1 Aug 2004 15:03:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051218@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> iptables -t nat -j DROP
>
> Will not block ESP traffic.

It's not a valid command, either.  In addition to specifying the table =
(-t nat) to act upon, you also need to specify a command and a chain to =
operate on; i.e.,

	iptables -t nat -A PREROUTING -j DROP

Not that I'm recommending the above rule, but it'll sure drop some =
traffic...

> On the other hand
>
> iptables -t filter -p 50 -j DROP
>
> will block ESP traffic.

Nope...

	iptables -A FORWARD -p 50 -j DROP
Or
	iptables -A INPUT -p 50 -j DROP
Or
	iptables -A OUTPUT -p 50 -j DROP

("-t filter" is assumed if no "-t" is specified)

<OT>
 Where is the new-found obsession with dropping packets in the NAT table =
coming from?
</OT>

-j

