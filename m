From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: NAT POSTROUTING accounting
Date: Mon, 16 Oct 2006 14:28:52 +0200
Message-ID: <45337B04.4040808@freemail.hu>
References: <8a1be4700610150743t6c089bfcm7648174d88793c00@mail.gmail.com>	<45327967.8080406@rtij.nl>
	<8a1be4700610160500r3bee8e52taa1e7f0c4765eb8c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a1be4700610160500r3bee8e52taa1e7f0c4765eb8c@mail.gmail.com>
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
> On 10/15/06, Martijn Lievaart <m@rtij.nl> wrote:
>
>> Create a seperate rule in FORWARD that jumps to an empty chain. Put th=
is
>> rule before the -m state rule(s).
>
> I will try to guess that by FORWARD you mean the filter FORWARD chain
> (as opposed to mangle FORWARD), & the empty chain that you're
> referring to is a user-defined chain,
> but I didn't get what you eman by "the -m state rule" since in my
> example I didn't use the state module.
>
> But in any case, doesn't the FORWARD chain only accounts for forwarded
> packets through the machine. What about locally generated packets?
>
> Thanks
>

Maybe you can use the mangle POSTROUTING chain...

Swifty

