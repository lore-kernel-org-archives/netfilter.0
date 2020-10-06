From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] granular rule for combined tcp & udp sports?
Date: Tue, 6 Oct 2020 08:54:00 +0000
Message-ID: <1e8b724a-7f94-a05a-d3e6-a45290ae6fe0@gmx.net>
References: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net>
 <20201006083150.GA14996@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601974449;
        bh=aKVW+8Wymkyzr99Ome6zagXI45SHiSZGu+u9WgcQ5LQ=;
        h=X-UI-Sender-Class:Reply-To:To:Cc:References:From:Subject:Date:
         In-Reply-To;
        b=Vby+UJPKQ9iGN4UHbVEksXClbmCk3E/s/1xLapSmF1PCEgrzHmS3ZCTz1za+xzwxD
         MAXtCvabSnUTf9H8pv9bckiRwZ6/jNnMjlS2+e92uvznPjihF+hn7WKLOLZNqpxx7/
         AnUwSrrlQugjK4OOgzoSAvwVQGEK3X+Dka3Wfuak=
In-Reply-To: <20201006083150.GA14996@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>

On 06/10/2020 10:31, Pablo Neira Ayuso wrote:
> On Mon, Oct 05, 2020 at 12:56:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> I am trying to get a granular logging rule going, combining tcp and ud=
p
>> sports for ip6 saddr but somehow failing:
>>
>>
>> tcp sport !=3D { 80, 443, 993, 5228 } udp sport !=3D 19302 ip6 saddr @=
g_6 log
>> flags all prefix "G_C :" continue
>>
>> -> Error: conflicting protocols specified: tcp vs. udp
> I suggest you express things is less convoluted ways, ie. positive
> logic and default action to drop in your ruleset.
>
> nft add rule ip6 x y meta l4proto . th dport { tcp . 80, tcp . 443, tcp=
 . 993, tcp . 5228, udp . 19302 } ip6 saddr @y accept
>
> You can set default policy in the chain to drop.

Thank you for the input. The rule is just for logging/debugging, not for =

dropping frames and the logic is not to log:

* frames from tcp sport(s) 80, 443, 993, 5228
* frames from udp sport 19302

but log all other frames from ip6 saddr @foo

For that purpose inverting positive (consulted) logic seemed the way to=20
go and this should to work then:

meta l4proto . th sport !=3D { tcp . 80, tcp . 443, tcp . 993, tcp . 5228=
,=20
udp . 19302 } ip6 saddr @foo flags all prefix "bar :" continue;


