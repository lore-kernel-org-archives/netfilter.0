From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Re: Suggestions for some patch-o-matic extensions (comment, ipp2p, 
 random, etc...)
Date: Wed, 16 Feb 2005 23:55:59 +0100
Message-ID: <4213CF7F.6060901@arcoscom.com>
References: <4213C6FD.5080705@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4213C6FD.5080705@arcoscom.com>
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

I don't know how to use diff/patch utils to send you a patch to solve=20
these issues, if anybody say me how to use them to create a valid patch=20
file and send to the list.

I suppose that I need some rules over the file names and so on, say me=20
and I post the patch.

I have the patched files too, but I don't know if I can send attached=20
files to the list.
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

mailto:samueldg@arcoscom.com
http://www.arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83


Samuel D=EDaz Garc=EDa wrote:
> In some extensions, I detected that before I apply patch-o-matic (last=20
> source package) without problems, i can compile kernel and kernel=20
> modules fine.
>=20
> But when I try to compile iptables, i have a common error with some=20
> extensions:
>    error: near initialization for `<struct_name>.<struct_member>'
>=20
> Some of these extensions are:
>    * comment
>    * ipp2p
>    * random (IPv6)
>=20
> Thinking about it, I had applied successfully these extensions over=20
> 1.2.11 iptables version, but with 1.3.0, seems that some structure=20
> declaration has been changed and these modules don't compile without a=20
> manual user modification of the sources.
>=20
> The "manual modification" should be an explicit member initialization in =

> the struct, but some modules need more revision.
>=20
> Here is the warning exposed.
>=20
> Good Luck
>=20
>=20
> --=20
>    Samuel D=EDaz Garc=EDa
>     Director Gerente
> ArcosCom Wireless, S.L.L.
>=20
> mailto:samueldg@arcoscom.com
> http://www.arcoscom.com
>=20
> M=F3vil: 651 93 72 48
> Tlfn.: 956 70 13 15
> Fax:   956 70 34 83
>=20
>=20
>=20

