From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: new tcp connections, without SYN
Date: 09 Apr 2003 15:06:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049893612.22719.31.camel@elendil.intranet.cartel-securite.net>
References: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09268776@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: netfilter@lists.netfilter.org, carlosble@terra.es

Le mer 09/04/2003 =E0 15:00, dhiraj.2.bhuyan@bt.com a =E9crit :
> As far as I understand, an "ACK" packet can also start a "NEW" connecti=
on.
> If the connection remains idle for long, the Netfilter's connection tra=
cking
> engine times out that connection and removes it's entry from the state
> table. Now when an "ACK" packet comes back after sometime, the connecti=
on
> tracking engine marks this as a "NEW" connection. However am not sure h=
ow
> the state changes to "ESTABLISHED".

Timers for Netfilter's conntrack should be the same as TCP stacks. So,
if conntrack times out, then destination TCP stack should time out too.
that means if a ACK gets so delayed that related conntrack entry gets
dropped, than it would be also dropped by destination TCP stack.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

