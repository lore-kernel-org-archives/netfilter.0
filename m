From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: PPTP Problem with 2.6.20-rc1 >=
Date: Fri, 19 Jan 2007 10:59:56 -0000
Message-ID: <002801c73bb8$f490f3b0$0301a8c0@hercules.decimalint.pt>
References: <001d01c7399d$66573b30$0301a8c0@hercules.decimalint.pt>
	<45B099C5.6060303@plouf.fr.eu.org>
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

Hum.. looking at that, i'd like to change to the new framework, but i nee=
d=20
this working anyway.
Where can i report this, on this mailling list or where's the correct pla=
ce=20
for that?

Jorge

----- Original Message -----=20
From: "Pascal Hambourg" <pascal.mail@plouf.fr.eu.org>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 19, 2007 10:13 AM
Subject: Re: PPTP Problem with 2.6.20-rc1 >=3D


Hello,

Jorge Bastos a =E9crit :
> I just updated kernel to 2.6.20-rc5, and i can't make pptp connections=20
> anymore, is just stoped in the AUTH step, hanging up witout sucess.
>
> I can see that diferent modules are used now, before i used:
> ---
> ip_nat_pptp
> ip_conntrack_pptp
> ---
>
> Now there's new modules with new names, like:
> nf_nat_pptp
> nf_conntrack_pptp
>
> Are they the same with diferent names?

nf_conntrack is the new layer-3 independent Netfilter connection
tracking framework. It supports both IPv4 and IPv6 and is aimed to
replace the old ip_conntrack framework which supports only IPv4.
nf_conntrack is included in the standard kernel since version 2.6.15,
but lacked support for NAT until version 2.6.20 so, as NAT is
unfortunately more widely used than IPv6, ip_conntrack was still the
default. ip_conntrack and nf_conntrack are mutually exclusive.

If you have trouble with nf_conntrack helper modules, you could rebuid a
kernel with nf_conntrack disabled and ip_conntrack enabled.



