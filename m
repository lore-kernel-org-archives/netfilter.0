From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: IPTABLES vs Checkpoint
Date: Wed, 27 Nov 2002 07:39:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D102020659@eketsv02.cubis.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Wayne,

basically, Ben's assessment pretty much hits the nail. Check Point
Firewall-1 and netftfilter/iptables are rather similar in their packet
filtering technology, both employ stateful filtering (CP has trademarked the
term 'stateful inspection'). AFAIK, neither perform advanced stuff like
packet normalization or sequence number validation. So, for plain TCP, UDP
and ICMP protocols, there should be no significant difference. There might
be differences in the implementations of the helper modules for not-so-plain
protocols, such as IRC, FTP and H.323. Both CP and iptables (and formerly
ipchains' masquerading modules) have had serious issues here, however, it's
just something that stateful filters can't do (as) well (as application
level gateways). CP FW-1 also comes with some ALGs, called resources, I
believe. These are nicely integrated, but typically don't offer the
flexibility of a separate ALG.

Ben is right when he says that CP is geared towards larger setups, their
separation of firewall nodes, management servers and user interface
demonstrates this. There's a large community for both systems, but the CP
crowd are more focussed on larger-scale enterprise deployment, while most
iptables people have a rather small LAN behind the box. That's not to say
one is technically better at either job, it just shows what sort of
community support you can expect.

Now personally, I'm all for open source and the good ole UNIX habit and
security paradigm of separating different tasks to individual tools, so by
gut feeling I'd prefer a properly built open-source solution over Check
Point. However, doing so would definitely require a bit of work and
expertise. I'm not sure maintenance of the result would actually be
considerably worse than that of the CP alternative, and OTOH I see a gain in
flexibility. The company definitely becomes more dependent on the person (or
people) who know the system. Untrained personnel would probably not be able
to cope with it or at least its details. You couldn't buy support contracts
for it.

The problem poses many different questions. Answer most, if not all of them,
and you should be able to decide pretty well what's best for you.

Cheers,
Tobias

