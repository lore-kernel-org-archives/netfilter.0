From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 19:19:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087319969.3576.12.camel@anduril.intranet.cartel-securite.net>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
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
To: Jonathan Villa <jvilla@e37.net>
Cc: netfilter@lists.netfilter.org

Le mar 15/06/2004 =E0 19:00, Jonathan Villa a =E9crit :
> my temporary solution : looping through 1-254

As someone pointed out yesterday, you can use iprange match from POM :

http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-iprange

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

