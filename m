From: "R. Lemos" <rslemos@hotmail.com>
Subject: One broadcast to many unicast NATing
Date: Tue, 30 Dec 2003 16:57:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F32XXfOiDKLYHl0004caee@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi,

I have a server which trust only a small number of hosts and must be totall=
y=20
hidden from the rest of its own local net (though I know I can't hide it in=
=20
the ethernet level). So I want to control which packets emerge from it,=20
allowing only some destination addresses.

Actually the problem is that I must run a closed-source software that=20
broadcasts to 255.255.255.255 and want to translate it to many (more than 2=
)=20
UDP unicast packets to these trusted hosts. Those packets must be binary=20
copied, except for the destination address, which will be DNATed.

It is like the DNAT target, but this one deals with one packet in and one=20
packet out (to a host randomly choosen among a list of hosts). I think I=20
need some sort of DNAT that one packet in is DNATed to many packets out (to=
=20
all hosts listed).

Could not find any such a target (one in, many out) in iptables. Did I miss=
=20
something? Is there any other (software) way to do it?

Thanks.

R. Lemos

_________________________________________________________________
MSN Messenger: instale gr=E1tis e converse com seus amigos.=20
http://messenger.msn.com.br


