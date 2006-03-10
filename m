From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Error in Masquerade ??
Date: Fri, 10 Mar 2006 16:48:31 +0100 (CET)
Message-ID: <50343.193.173.147.3.1142005711.squirrel@webmail.sterenborg.info>
References: <581260b00603100737k630aaa8l@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <581260b00603100737k630aaa8l@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Fri, March 10, 2006 16:37, Leandro Silva wrote:
> Hello Jorge !
>
> Thanks for the response.
> When i have a fixed ip i can use SNAT, but i have some dsl links with
> dynamic ip so i can't use SNAT :-(
>
> Leandro

If you have a ppp adapter you need MASQUERADE.
If you have DSL with a static or "dynamic" (dynamically assigned, but it
doesn't change) IP address on an eth interface you can still use SNAT. E.=
g. I
have a DSL line which assignes a static IP address. I use SNAT.

> -------
> Leandro:
>
> You need another rule to alter the source ip address of the outgoing pa=
ckets.
>
> iptables -t nat -A POSTROUTING -o eth0 \ -j SNAT --to-source <server_ad=
dress>
>
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

You do *not* need both rules.


Gr,
Rob


> El vie, 10-03-2006 a las 12:01 -0300, Leandro Silva escribi=F3:
>> I have the following rule in my firewall:
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE And that's the
>> only rule if postrouting chain. It's working fine but from time to
>> time a packet leaves the server with the original ip and not with the
>> server's. It's happening  like 1 "wrong" packet for 100 or 200 ok.
>> I've tried in other servers with same results and different
>> "Mandrakes" ( 9.1, 10,1 and 2006.0 ). And different cpus ( p3, p4,
>> amd, all with 512 mb ram ).
>> Any ideias ?
>>
>> Thanks a lot
>> Leandro



