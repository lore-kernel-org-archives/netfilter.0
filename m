From: =?iso-8859-1?Q?Ehrhardt_Ren=E9?= <r.ehrhardt@eviatec.de>
Subject: AW: pptp-conntrack-nat and kernel 2.6.7
Date: Fri, 6 Aug 2004 10:17:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <94F30CDB27E39547A10F4E71E9AF114B2DEEB9@dlb-dc02.intern-eviatec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org


Ehrhardt Ren=E9 wrote:
>> i=B4m running a debian sarge beta 4 box with iptables 1.2.10, I have =
to install the pptp-conntrack-nat patch.=20
>>=20
>> I have the newest CVS build of pom

>You should be using pomng, not pom (which is no longer maintained).

Sorry this was my fault i=B4m using pomng

...
...
...

>It means that the patch is trying to apply to the 2.4.x style config
>files, but you are using a 2.6.x kernel which does not have these.

>> Is there any way to get this thing working?

>Unfortunately no.  Noone has ported the pptp patch to 2.6.x yet.

Thanks a lot !


