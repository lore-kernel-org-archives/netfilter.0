From: Stindl Wolfgang EXT <Wolfgang.Stindl.extern@icn.siemens.de>
Subject: AW: Logging to where?
Date: Wed, 7 Apr 2004 08:14:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <47D438A0510BD611B9470002A58EDAE704DE6575@mchh2a6e.mchh.siemens.de>
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
To: "'stu@gateway10.homeip.net'" <stu@gateway10.homeip.net>, netfilter@lists.netfilter.org

Iptables isn't logging to any file,
It is logging to syslog.

You have to change your settings in /etc/syslog.conf

Ciao
wolfi

> -----Urspr=FCngliche Nachricht-----
> Von: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] Im Auftrag von=20
> Stuart Lamble
> Gesendet: Mittwoch, 7. April 2004 07:32
> An: netfilter@lists.netfilter.org
> Betreff: Logging to where?
>=20
>=20
> Hi
>=20
> By default if you LOG on the iptables, does it log to=20
> /var/log/messages
> ?
> If that is correct, is it possible to ask iptables to log for=20
> example to
> /var/log/iptables ?
>=20
> Thanks
> Stuart
>=20
>=20
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.650 / Virus Database: 416 - Release Date: 4/4/2004
> =20
>=20
>=20

