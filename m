From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Iptables problem with Mail Server
Date: Tue, 25 Oct 2005 17:59:49 +0200
Message-ID: <435E5675.4090706@mnemon.de>
References: <000b01c5d99a$49bb74a0$3a01010a@TRAINERSB>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000b01c5d99a$49bb74a0$3a01010a@TRAINERSB>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

your link is broken

sameer bagwe wrote:
>  I have two servers running Linux. Server A is SAMBA domain controller =
and Server B is MAIL server(qmail)
> My Server A has two NIC. One two my ISP(172.16.57.188/30) and the other=
 to my LAN.(172.16.19.0/24)
>=20
> Server A LAN IP =3D 172.16.19.230
> Server A ISP IP =3D 172.16.57.190
>=20
> Server B IP =3D 172.16.19.231
> Server B also has a dial up option for backup if ISP is down
>=20
> I have attached my iptable script.
> http://s59.yousendit.com/d.aspx?id=3D...GF23Y94C8R092VF
>=20
> If i set default INPUT Policy to DROP then incoming Mail stop coming.
>=20
> I add a rule at the end of the script:
> ipt -A -s 0/0 -d $LAN_IP -j REJECT
>=20
> The above rule will also block nmap port scans.
>=20
> I am not a pro in iptables. Just know scripting and adding intermediate=
 level rules.Please let me know how to fix this
>=20
> Thanks=20
>=20
> Best Regards,
> Sameer Bagwe
>=20
> --
> Only The Inquiring Mind Solves Problems !
>=20
> !DSPAM:435e231e12299217213932!


--=20
-----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Niederkastenholzerstr. 24a
53881 Euskirchen

Tel.: (+49) 22 55 9 48 78 22
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
-----------------------------------------------------------------------
English version below.

Aufgrund massiven SPAM Aufkommens, werden Mails, die unser SPAM
Filter als SPAM einstuft, automatisch gel=F6scht. Falls Ihre Mail
f=E4lschlicherweise als SPAM eingestuft wurde, senden Sie bitte eine
Email mit "No-Spam:" im Betreff.

Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

Due to massive SPAM, all mails our content filter classifies as SPAM,
are discarded silently. If you mail was classified as SPAM by mistake,
please send an email with "No-Spam:" within the subject.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
-----------------------------------------------------------------------


