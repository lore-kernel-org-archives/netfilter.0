From: Saulius Menkevicius <razzmatazz@mail.lt>
Subject: how to forward packets to another gateway, if i'm one
Date: Fri, 6 Dec 2002 19:28:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ISPFE7vXn10A5fpk965000657df@mail.takas.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,
  I've spend some time searching Google on the topic, however 
eventually gave up. So..

  Is there any way of forwarding packets to another gateway,=
 which, 
besides, is on the same network. Say, I'm on IP 10.0.0.2, and I=
 act 
as a gateway (ADSL, really) for a number of machines on the same=
 LAN. 
And there's another such gateway, hooked to another ADSL, which 
handles connections for another bunch of machines. Essentially=
 the 
hosts 10.0.0.1 and 10.0.0.2 are identic and perform the same 
function.

  Now, I want to make some traffic that comes from some client=
 and 
that should go through gateway 10.0.0.1 to be forwarded to=
 10.0.0.2 
(without any changes). The need is to make the forwarding=
 transparent 
to both 10.0.0.2 and the client.

  So it's the way I suppose it should be done:
=09a) No changes to be made 10.0.0.2's firewalling rules (in fact,=
 it 
runs FreeBSD);
=09b) Make 10.0.0.1 to forward them to 10.0.0.2 transparently. 

_This_is_the_culprit_. I don't know how to make them (packets) go=
 
that way. DNAT/SNAT doesn't suit, neither does REDIRECT, as they=
 
modify packets they filter.

=09In FreeBSD, there's ipfw rule fwd, e.g. if 10.0.0.1 ran bsd, i'd=
 
type "ipfw add fwd 10.0.0.2 ip from some_client to any". I'm=
 looking 
for the a way on how to make the same effect on Linux/iptables.
=09Wrote to much of blurb. Guess I didn't mess it up too much :)

=09Thanks. 
-- 
Saulius Menkevicius, razzmatazz@mail.lt on 12.06.2002



