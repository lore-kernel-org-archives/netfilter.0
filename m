From: Ernesto Silva <silva@ort.edu.uy>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 14:39:07 -0300
Message-ID: <44CE403B.4000003@ort.edu.uy>
References: <44CE313A.4040204@ort.edu.uy>
	<5801cedd6a9e2c3fb5137903c6ba8c73@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5801cedd6a9e2c3fb5137903c6ba8c73@former03.de>
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

Hi Baltasar,

Sorry, it was a typo, _nat is defined as "iptables -t nat -A POSTROUTING"=
 so thats not the problem.

I was not clear enough, I don't have an ftp server, I just want to access=
 internet ftp servers from my internal network
which is protected by the firewall. The firewall itself don't have any ot=
her running service but iptables.

Regards, and many thanks,
--=20
Ing. Ernesto Silva.
Coordinador de Desarrollo Web y Sistemas Abiertos
Universidad ORT Uruguay.
E-mail: silva@ort.edu.uy
Tel: (+598-2) 902-1505 ext. 206


former03 | Baltasar Cevc wrote:
> Hi Ernesto, hi everybody,
>=20
>> _fwd=3D"iptables -A FORWARD"
>> _nat=3D"iptables -A POSTROUTING"
>=20
>=20
> Postrouting is in the nat table, so you have to add "-t nat" to _nat an=
d=20
> make it
>    _nat=3D"iptables -t nat -A POSTROUTING"
>=20
>>    I'm having a problem to access internet ftp servers from my=20
>> internal network. I understand the ftp connection but I don't have=20
>> enough information about ip_conntrack_ftp and ip_nat_ftp modules, so=20
>> here is my situation.
>=20
>=20
> Apart from that you will need more rules for FTP, that's the tricky=20
> part. What worked well for me was using vsftpd with a port specifiactio=
n=20
> for the data connections and allow these ports in INPUT|FORWARD.
> It may work using the ftp conntack module, but I don't know anything=20
> about that. You will have to add some port 20 rule, though.
>=20
> Baltasar
>=20
> --=20
> Baltasar Cevc
>=20
> _____ former 03 gmbh
> _____ infanteriestra=DFe 19 haus 6 eg
> _____ D-80797 muenchen
>=20
> _____ http://www.former03.de
>=20
>=20


