From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: NAT POSTROUTING accounting
Date: Mon, 16 Oct 2006 16:03:20 +0200
Message-ID: <45339128.4010609@freemail.hu>
References: <8a1be4700610150743t6c089bfcm7648174d88793c00@mail.gmail.com>	<45327967.8080406@rtij.nl>	<8a1be4700610160500r3bee8e52taa1e7f0c4765eb8c@mail.gmail.com>	<45337B04.4040808@freemail.hu>
	<8a1be4700610160622q533ac28di9ab37f5735ddd554@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a1be4700610160622q533ac28di9ab37f5735ddd554@mail.gmail.com>
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
To: Kamal <kamash@gmail.com>
Cc: netfilter@lists.netfilter.org

Kamal =EDrta:
> This is one way, but isn't there a more graceful way other than
> putting duplicate entries in NAT POSTROUTING & mangle POSTROUTING.
>
> Thanks
>
Hmm... I do not understand you clearly... What do you mean "more=20
graceful"... ? :)

1. You may do some changes on the packets... (SNAT/DNAT, etc...)

2.a. You have to mark or identify the packets you want to count in other=20
chains ... (MARK target or direct rules)

2.b. You can use the mangle POSTROUTING chain for counting specified=20
packets because this is the "last" chain BEFORE every packet leaves the=20
system.
(I know that there is a "raw" table...)

So... How do you want to do it "more graceful" ?

Swifty

