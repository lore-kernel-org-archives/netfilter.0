From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: OT: Switch packet leakage
Date: Sun, 27 Mar 2005 21:24:20 +0200
Message-ID: <1111951460.5199.7.camel@anduril.intranet.cartel-securite.net>
References: <1403218a05032703237431b6a4@mail.gmail.com>
	<1111944083.4316.3.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1111944083.4316.3.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 27 mars 2005 =E0 12:21 -0500, Jason Opperisano a =E9crit :
> http://ettercap.sourceforge.net/

Imho, ARP cache poisoning attacks are nothing related with potential
switch leakage.

For the OP, I could experience leakage on old switches that turned to
"hub mode" when flooded, but nowadays, serious products don't seem to
have this kind of behaviour. Furthermore, you have plenty of options to
tweak so they can't hit such situation, such as port security stuff.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

