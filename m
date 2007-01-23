From: Michal Martinek <michal.martinek@siemens.com>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 11:18:04 +0100
Message-ID: <45B5E0DC.2020703@siemens.com>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B5DF09.6030001@freemail.hu>
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
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org



G=E1sp=E1r Lajos wrote:
>=20
> Michal Martinek =EDrta:
>> Hello all,
>>
>> I am quite a newbie to the netfilter world, so maybe my approach is=20
>> naive. I would like to block communication coming from/to some ports=20
>> according to the content of packets. Unfortunately these ports are not=
=20
>> static, so port specific netfilter rule cannot be used. So my question=
=20
>> is:
>>
> Do you know the STRING module ?

I'm afraid not. Can you give me some explanation (or link)?

>> Is it possible to obtain some address info (source/destination address=
=20
>> and ports) from the packet queued from netfilter?


