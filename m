From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: -m helper --helper -irc
Date: Tue, 17 Aug 2004 15:46:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905129B@asimail2.alphanumeric.com>
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

>   I use following rule for marking irc dcc transfers from my NATed =
lan.
>
>   iptables -t mangle -A PREROUTING -p tcp -m helper --helper irc \
>   -m mark --mark 0 -j MARK --set-mark 1
>
>   And this works perfectly when I send a file to somebody, and doesn't
>   when somebody sends something to me. Why?

i was under the impression that ip_conntrack_irc was written to handle =
outbound DCC transfers only...not inbound.  there may be a patch =
floating around that makes it work inbound as well--try google / =
marc.theaimsgroup.com/?l=3Dnetfilter...

as an aside--what is that rule doing exactly, 'cause you've stumped me.  =
to me, it says, "if a packet has a mark =3D 0, set the mark to 1" and =
you're doing this in the PREROUTING chain of the mangle table--where is =
the mark =3D 0 coming from (as i can tell, it could only be coming from =
a previous rule in mangle:PREROUTING)?

-j

