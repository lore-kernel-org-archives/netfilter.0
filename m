From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: beginner, trying to use iptables.
Date: Thu, 29 Jan 2004 16:33:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075390432.4046.45.camel@elendil.intranet.cartel-securite.net>
References: <66CE949D18BCB249ABE8D9AF48C4F1CE777B08@helios.clb.tcfr.thales>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <66CE949D18BCB249ABE8D9AF48C4F1CE777B08@helios.clb.tcfr.thales>
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
To: Christophe.LINDHEIMER@fr.thalesgroup.com
Cc: netfilter@lists.netfilter.org

Le jeu 29/01/2004 =E0 16:20, Christophe.LINDHEIMER@fr.thalesgroup.com a
=E9crit :
> Hum, it looks good but when @1 sends data to @2 using TCP/IP,=20
> I need to get data in my application running on bridge in order to choo=
se if
> data must be sent to @2.=20

Then you'll have to use iptables QUEUE target.

Or transparent proxying to your application on the bridge, using frame
diverter and REDIRECT target (see my article in Linux Magazine France HS
Kernel n=B02).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

