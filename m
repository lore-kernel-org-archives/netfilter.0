From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: State of Stateful Inspection
Date: 25 Oct 2002 10:21:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035534115.9045.9.camel@elendil>
References: <1035489978.1558.27.camel@lappy.fuzzypenguin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035489978.1558.27.camel@lappy.fuzzypenguin.net>
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
To: Jason Dixon <jasondixon@myrealbox.com>
Cc: netfilter@lists.netfilter.org

Le jeu 24/10/2002 =E0 22:06, Jason Dixon a =E9crit :
> I'm about to become a migrated iptables user, but I had a couple of
> questions about the stateful abilities of netfilter.  First, it appears
> that true sequence number analysis is available via this "patch-o-matic=
"
> thingy.  At what point does this feature become part of the default
> release?

Well, you should ask netfilter-devel mailing list ;)
But, as the patch is still in patch-o-matic extra section, I do not
think it will be submitted to kernel soon.

> Also, does netfilter support any sort of sequence modulation to
> strengthen the randomness of weak tcp implementations?

No.
But you can use third party patch walled IP Personality :

	http://ippersonality.sourceforge.net/

This patch aims at fooling OS fingerprinting systems such as nmap by
modifying network stack behaviours, both locally and for routed packets.
In particular, you can act on ISNs, and so randomize them for network
that are behind your firewall.

Beware : this patch can also weaken your architecture if you decide to
"export" OS fingerprints like Dreamcasts or HP printers ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

