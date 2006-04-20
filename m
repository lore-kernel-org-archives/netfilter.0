From: Mario <mariounixuser@yahoo.com.mx>
Subject: Re: packets loging
Date: Thu, 20 Apr 2006 15:47:08 -0500
Message-ID: <4447F34C.6030500@yahoo.com.mx>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002d01c66445$01dd28f0$0e01050a@CyberAdmin>
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
To: robee <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org

robee wrote:

> when i use -j LOG target, netfilter writes so many information to=20
> syslog. what can i use to write only IN and OUT interface, SRC and DST=20
> host?
>
> robee
>
>
$myLoglevel=3Dinfo ...

iptables -A _____ -i $intif -s $Src -o $outif -d $Dest ________ -j LOG=20
--log-prefix "xxxxxxx" --log-level $myLoglevel

and a little change in syslog.conf... like: kern.=3Dinfo=20
/var/log/kern.info.log ....




__________________________________________________
Correo Yahoo!
Espacio para todos tus mensajes, antivirus y antispam =A1gratis!=20
Reg=EDstrate ya - http://correo.yahoo.com.mx/=20


