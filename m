From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Brigde and Firewall with linux
Date: Thu, 11 Dec 2003 11:49:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071139792.796.114.camel@elendil.intranet.cartel-securite.net>
References: <20031211101446.16719.qmail@web25207.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031211101446.16719.qmail@web25207.mail.ukl.yahoo.com>
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
To: ONeill Jack <jackoneill9@yahoo.fr>
Cc: Luca Scattin <luca@atlantenet.com>, netfilter@lists.netfilter.org

Le jeu 11/12/2003 =E0 11:14, ONeill Jack a =E9crit :
> I thought you could only use the FORWARD CHAIN when
> it's a bridge, because a bridge only passes packets
> from one interface to another (?)

No, it also crosses PREROUTING and POSTROUTING. See ebtables
documentation, especially :

	http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

