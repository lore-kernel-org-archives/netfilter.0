From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: 22 Oct 2002 22:09:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035317344.8858.14.camel@elendil>
References: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210221455120.15018-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le mar 22/10/2002 =E0 20:57, Robert P. J. Day a =E9crit :
>   i've had a number of people tell me that, while they put a
> good deal of thought into their INPUT filtering, they simply
> ACCEPT all outgoing traffic since, if their input filtering
> is working properly, there's no reason to stop outgoing
> packets.
>   comments?

Once you have accepted the fact that your box can get compromised, you
easily understand why you should filter outgoing traffic. Moreover,
maximum security relies on the "lesser privilege rule" which specifies
that an object must not be allowed to do more than he has to. According
to this, you have to filter network output.

Consider you have a web server which is vulnerable to a 0day private
flaw. It is exploited, then cracker has a low privilege shell. If your
output is not filtered, he can just send any packet he wants which can
be bad for your environment, especialy when INPUT chain accepts all
ESTABLISHED packets. Well, if he gets root, you're lost unless you
harden your kernel with access control stuff like LIDS. But, in between,
it slows down the attacker and make its progression far more difficult.

If you plan to filter traffic on the box itself, than you have to do it
well. Not filtering in OUTPUT chain is just the same as if you set a
firewall up with no rule for returning packets, something like :

	iptables -A FORWARD -s $IN_NET -i $IN_IF -o $OUT_IF -j ACCEPT

which is, imho, truely bad.

You have, on one hand, to protect your box from the outside (that's
INPUT filtering). But on the other hand, you have to protect the rest of
your infrastructure (and also others) from this very box (this is OUTPUT
filtering).

Then it is just a matter of what security level you want to reach ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

