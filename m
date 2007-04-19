From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: DNAT not working
Date: Thu, 19 Apr 2007 13:15:09 +0200
Message-ID: <46274F3D.8040407@freemail.hu>
References: <20070418162604.GA10834@tranquility.scriptkitchen.com>	<462656A8.3090003@rtij.nl>
	<20070419033123.GB22763@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070419033123.GB22763@tranquility.scriptkitchen.com>
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
To: netfilter@lists.netfilter.org, payal-iptables@scriptkitchen.com

Payal Rathod =EDrta:
> On Wed, Apr 18, 2007 at 07:34:32PM +0200, Martijn Lievaart wrote:
>  =20
>> Payal Rathod wrote:
>>    =20
>>>      =20
=2E..
>> Try -d 1.2.3.4 instead of -s.
>>    =20
>
> But now it is timing out instead of connecting.
> The new ruleset is at,
>
> http://pastebin.ca/447539
>
> Can someone tell what might be wrong?
>  =20
=2E..

1. Your FORWARD policy is ACCEPT... You do not need the lines 14 and 15. =

(AFAIK: If the target IP is on your computer then it fill not be=20
FORWARDed but will be sent to a LOCAL process.)
2. You did not wrote but I assume you have a dynamically assigned IP=20
connection. (Line 22.) If it is true then I would specify in this line=20
the output interface: "-A POSTROUTING -s 10.10.0.0/255.255.255.0 -o=20
???ppp+??? -j MASQUERADE"
3. Line 23: ???? Why do you DNAT an outgoing connection back to you ???=20
Maybe you do not need that line at all...

Hope that helps.

 Swifty


