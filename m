From: "hare ram" <hareram@sol.net.in>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 20:45:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <014201c3a3af$abc00bc0$c2bf09ca@Housecall>
References: <60101.200.180.170.253.1068041679.squirrel@www.alcidesmaya.com.br> <1068043048.810.141.camel@elendil.intranet.cartel-securite.net>
Reply-To: "hare ram" <hareram@sol.net.in>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>, Leandro Takashi Hirano <takashi@alcidesmaya.com.br>
Cc: Lista de Mail netfilter <netfilter@lists.netfilter.org>

Hi

iam using p-o-m with PSD patch

right now iam running this

iptables -A INPUT -m psd -j DROP

how do i run the script like this
Log the Portscanner IP and Drop them

thanks
hare

----- Original Message -----=20
From: "Cedric Blancher" <blancher@cartel-securite.fr>
To: "Leandro Takashi Hirano" <takashi@alcidesmaya.com.br>
Cc: "Lista de Mail netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, November 05, 2003 8:07 PM
Subject: Re: Port Scanner


Le mer 05/11/2003 =E0 15:14, Leandro Takashi Hirano a =E9crit :
> Is it safe to use only this rule to avoid port scanners?

See psd match :

http://www.netfilter.org/documentation/pomlist/pom-base.html#psd

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!



