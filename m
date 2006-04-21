From: "robee" <mlody@elpec.com>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 08:34:09 +0200
Message-ID: <000d01c6650d$99afe6e0$0e01050a@CyberAdmin>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
	<4447F34C.6030500@yahoo.com.mx>
Reply-To: robee <mlody@elpec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: netfilter@lists.netfilter.org

----- Original Message -----=20
From: "Mario" <mariounixuser@yahoo.com.mx>
To: "robee" <mlody@elpec.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Thursday, April 20, 2006 10:47 PM
Subject: Re: packets loging

> robee wrote:
>> when i use -j LOG target, netfilter writes so many information to syslog=
.=20
>> what can i use to write only IN and OUT interface, SRC and DST host?
>> robee
> $myLoglevel=3Dinfo ...
> iptables -A _____ -i $intif -s $Src -o $outif -d $Dest ________ -j=20
> LOG --log-prefix "xxxxxxx" --log-level $myLoglevel
> and a little change in syslog.conf... like: kern.=3Dinfo=20
> /var/log/kern.info.log ....
> __________________________________________________
> Correo Yahoo!
> Espacio para todos tus mensajes, antivirus y antispam =A1gratis! Reg=EDst=
rate=20
> ya - http://correo.yahoo.com.mx/

my rules looks like this:
    iptables -I FORWARD -p tcp -i ! eth0 --dport 80 -m state --state NEW -j=
=20
LOG --log-prefix HTTP_ --log-level info

and i get something like this in /var/log/kernel
    Apr 21 04:09:20 master kernel: HTTP_IN=3Deth2 OUT=3Deth0 SRC=3D10.11.9.=
2=20
DST=3D213.54.82.29 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D57962 DF =
PROTO=3DTCP=20
SPT=3D3636 DPT=3D80 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0

but i want only this:
    Apr 21 04:09:20 master kernel: HTTP_IN=3Deth2 OUT=3Deth0 SRC=3D10.11.9.=
2=20
DST=3D213.54.82.29


any sugestion?

robee=20


