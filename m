From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: State RELATED and more then one conntrack helper
Date: Tue, 21 Dec 2004 11:04:32 +0100
Message-ID: <1103623472.4631.1.camel@anduril.intranet.cartel-securite.net>
References: <1103616152.41c7d898dbee0@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103616152.41c7d898dbee0@webmail.kwsoft.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: lst_hoe01@kwsoft.de
Cc: netfilter@lists.netfilter.org

Le mardi 21 d=E9cembre 2004 =E0 09:02 +0100, lst_hoe01@kwsoft.de a =E9crit =
:
> Is there a possibility to limit this matching to only a special module??

See helper match.

helper match v1.2.11 options:
[!] --helper string        Match helper identified by string

So restricting to ftp helper :

	-m helper --helper ftp


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

