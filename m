From: "zze-KHOURY Jad FTRD/DMI/CAE" <jad.khoury@rd.francetelecom.com>
Subject: RE : Log Files
Date: Thu, 17 Jun 2004 10:23:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D4EF10CCEB2CE742BEEA9838C590B0E802199BCE@ftrdmel2.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Marc Haber <mh+netfilter@zugschlus.de>, Netfilter List <netfilter@lists.netfilter.org>

Try to use the ulog Target. It's independent from kernel . U have to =
install the Ulogd deamon

Regards.

-----Message d'origine-----
De : netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] De la part de Marc Haber
Envoy=E9 : jeudi 17 juin 2004 09:56
=C0 : Netfilter List
Objet : Re: Log Files


On Thu, Jun 17, 2004 at 12:48:00AM -0700, Patrick Nelson wrote:
> Is there any way to send to a specific log file?

Netfilter logs come as normal kernel messages, so you can't select by =
facility.priority. I'd recommend using something like syslog-ng which =
allows you to filter per regexp, or to use some post-processing =
facility.

Greetings
Marc

--=20
-------------------------------------------------------------------------=
----
Marc Haber         | "I don't trust Computers. They | Mailadresse im =
Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 =
32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 =
31 29


