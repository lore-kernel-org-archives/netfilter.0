From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Accept icmp-type destination-unreachable with limit
Date: 01 Apr 2003 10:21:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049185317.14477.17.camel@elendil.intranet.cartel-securite.net>
References: <000c01c2f716$b9fde2c0$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c2f716$b9fde2c0$0200a8c0@klintan.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael K <micke@klintan.se>
Cc: netfilter@lists.netfilter.org

Le lun 31/03/2003 =E0 01:47, Michael K a =E9crit :
> > Is this a good rule? According to
> > http://www.robertgraham.com/pubs/firewall-seen.html#8.1 It's a good
> > thing to accept this icmp type 3 and 4. But now the firewall=20
> > is open for
> > dos attacks. So I thought I put a limit to the rule.=20
> > iptables -A INPUT -p ICMP --icmp-type destination-unreachable \
> > 	-m limit --limit 10/minute --limit-burst 5 -j ACCEPT
> > iptables -A INPUT -p ICMP --icmp-type source-quench -j ACCEPT
> Is there no comments on this?

Just one.

When an ICMP error packet is received by your box, conntrack tries to
associate it to an existing IP flow in conntrack table. If it does match
something, it is RELATED ; if not, it's INVALID.

So, if you want to accept ICMP errors, just accept RELATED stuff. And
that's what you do with your last rule :

> > iptables -A INPUT -p ALL -m state --state RELATED,ESTABLISHED
> > -j ACCEPT

This means that even if a ICMP destination-unreachable breaks the limit
you set, it will be accepted as long as it is flaged RELATED.

So, imho, you should first DROP all INVALID stuff at ruleset top. It's
better get rid of them at first than wasting ressources in having them
go through the whole chain and get dropped by policy. So, no INVALID. At
this point, ICMP error packets you'll get into your next rules are
RELATED, and so are not likely to be part of a DoS. If someone's try to
DoS you via ICMP, most of packet's you'll receive will be INVALID, and
will get dropped. So you're right in saying you do not need theses
rules.

So, for Netfilter as a good conntrack engine, I would let it handle ICMP
errors. Better focus on DoS that are based on ping, UDP, TCP SYN, or
stuff.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

