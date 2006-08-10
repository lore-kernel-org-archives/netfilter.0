From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Problem with router connected to two ISPs (connection marking?)
Date: Thu, 10 Aug 2006 17:04:47 +0200
Message-ID: <44DB4B0F.2070909@freemail.hu>
References: <200608082140.03815.marek.zachara@telperion.pl>	<44D9CB5B.9020508@freemail.hu>	<200608091435.49051.marek.zachara@telperion.pl>
	<3b37c573ddc16140d97b8e68d15aa489@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3b37c573ddc16140d97b8e68d15aa489@former03.de>
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
To: former03|Baltasar Cevc <baltasar.cevc@former03.de>
Cc: Marek Zachara <marek.zachara@telperion.pl>, netfilter@lists.netfilter.org

former03 | Baltasar Cevc =EDrta:
>
> On 09.08.2006, at 14:35, Marek Zachara wrote:
>
>>>
>>> Maybe these lines will help you... :) But if not.... :D
>>>
>>> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
>>> --to-source $MY_IP
>>> $IPT -t nat -A POSTROUTING -j SNAT -p tcp --dport www -d $WWW
>>> --to-source $MY_IP
>>>
Sorry... That was a misstype and also a missunderstood ...

Try these lines:

$IPT -t mangle -A PREROUTING -j CONNMARK -p tcp --dport www -d $WWW1=20
--set-mark 1
$IPT -t mangle -A PREROUTING -j CONNMARK -p tcp --dport www -d $WWW2=20
--set-mark 2

$IPT -t nat -A PREROUTING -j DNAT -i eth0 -m connmark --mark 1=20
--to-destination $INT_WWW
$IPT -t nat -A PREROUTING -j DNAT -i eth0 -m connmark --mark 2=20
--to-destination $INT_WWW

$IPT -t nat -A POSTROUTING -j SNAT -o eth0 -m connmark --mark 1=20
--to-source $EXT_WWW1
$IPT -t nat -A POSTROUTING -j SNAT -o eth0 -m connmark --mark 2=20
--to-source $EXT_WWW2



