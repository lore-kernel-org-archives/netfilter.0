From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Filter ips
Date: Fri, 01 Sep 2006 10:05:12 +0200
Message-ID: <44F7E9B8.4010001@freemail.hu>
References: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
	<44F7E55B.5000406@freemail.hu>
	<Pine.LNX.4.61.0609010956010.13189@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609010956010.13189@yvahk01.tjqt.qr>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Jan Engelhardt =EDrta:
>> iptables -A INPUT -s 192.168.0.5 -p tcp -m multiports --dports 20,21 -=
j DROP
>>    =20
>                                                       ^
>
> -m multiport
>
>
> Jan Engelhardt
>  =20
You have got the point !!! :)

