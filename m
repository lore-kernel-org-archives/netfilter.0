From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: DNAT + 2 uplinks + route = nogo
Date: Wed, 15 Oct 2003 10:23:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E101199077@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I'm in real trouble here so I hope somebody is able to answer this today =
(I know, my mistake in planning doesn't mean you will rush. I can try, =
can't I? ;)

Problem as follows:

- 1 linux box with 4 interfaces. Internal (private space), DMZ (can be =
ignored for this issue), 2 uplinks to different providers with different =
public ranges.
- DNAT (actually portforwarding) set up to to a few internal boxes on 1 =
uplink.
- I want to do DNAT to the same internal IP-addressess over the second =
link (obviously with different public ip-addressess).
- Routing chooses the wrong uplink (gateway) for the return packets.

Cause:
DNAT is only undone at the last moment so even with iproute2's "ip rule" =
trick I can't discern between connections coming in through one link or =
the other for the return packets.

Solution that I can think of:
If connections are DNATted, recall the routing routing after undoing the =
DNAT for the return packets. Problems with said solution: I can read C =
code, but only barely, and not write it. Also, I have only a very =
shallow understanding of the routing code and I'm running out of time. I =
don't know if the code allows the distinction between DNAT return =
packets from all other packets so that this can be done at all.

Question:
I have no idea how complex it would be to create this 'hack'. Does =
anyone know of a patch that realises this feature or is someone prepared =
to create such a patch? If not, whom should I ask instead?

Desperatly yours,

Gaby Schilders
IBFD network admin

