From: "Samuel Jean" <sj-netfilter@cookinglinux.org>
Subject: Re: Connlimit problem
Date: Wed, 26 Jan 2005 11:00:51 -0500 (EST)
Message-ID: <28079.142.169.215.10.1106755251.squirrel@142.169.215.10>
References: <001801c503b3$115416c0$910010ac@coco>
	<41F7AFBE.8080509@arcoscom.com> <004a01c503b8$61f418a0$910010ac@coco>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004a01c503b8$61f418a0$910010ac@coco>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Omar Garcia <omar.garcia@fractalia.biz>
Cc: netfilter@lists.netfilter.org, samueldg@arcoscom.com

On Wed, January 26, 2005 10:04 am, Omar Garcia said:
>
> No effect, the same responsed.
>
> # iptables -t filter -A FORWARD -m connlimit --connlimit-above 100 -j D=
ROP
> iptables: No chain/target/match by that name
>
> # iptables -t filter -A OUTPUT -m connlimit --connlimit-above 100 -j DR=
OP
> iptables: No chain/target/match by that name

To add on my previous post, if you in-kernel compiled the connlimit
code, then only :

cat /proc/net/ip_tables_matches

can tell you wheter it is properly loaded or not.

>
>
> ----- Original Message -----
> From: "Samuel D=EDaz Garc=EDa" <samueldg@arcoscom.com>
> To: "Omar Garcia" <omar.garcia@fractalia.biz>
> Sent: Wednesday, January 26, 2005 3:57 PM
> Subject: Re: Connlimit problem
>
>
>> It is working in "filter" table, not in mangle.
>>
>> Try it, I think connlimit is only for filters.
>>
>> Say us.

Samuel:

A match type module is valid for any tables. Only the
hook matters as some module can't filter some situation.

Exemple: mac match can't filter into OUTPUT or POSTROUTING chains.

What maybe made you confused is that a target type module cares
about the table.

>>
>> --
>>     Samuel D=EDaz Garc=EDa
>>      Director Gerente
>> ArcosCom Wireless, S.L.L.
>>
>> mailto:samueldg@arcoscom.com
>> http://www.arcoscom.com
>> m=F3vil: 651 93 72 48
>> tlfn/fax: 956 70 13 15
>>

I like your name 8)

HTH,

Samuel



