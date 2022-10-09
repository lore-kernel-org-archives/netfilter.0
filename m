From: Eric <evil.function@proton.me>
Subject: Re: Updating set elements from command line
Date: Sun, 09 Oct 2022 14:34:22 +0000
Message-ID: <GYed1LiiUbZ_boa2g0lkRtQWWNc-5rwhwNR8x_LfDAm8iffWDAZjCg7QdGZoqB6nAbHZNVcTFPSNyADz_3zwQKR1234-I4Z8fKSnaQnwqz4=@proton.me>
References: <Eio6D1ukecFTMx3qFhiCTbHRPOiSKqei5fvfeaGcMc4SfXxZriRAXGFv_HgaBa-wVulHKr7D-6mE6RNQOJztUM1tooTU5nCqQ1Z9AO_o_IM=@proton.me> <20221009053950.be64bd6555d9c7060e363136@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1665326071; x=1665585271;
        bh=A/XT9HaiC8m7/NWwiWO0t88PrUDBPparvfJOwKWBZIM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=MwhS40TMjvRhlaAjU8ff2G6+xQ/Lv/rHNhokUddoya0IE1/Snh+P+2JpoBvgDdJ0/
         QwTQgpvrwBpYMyNw4f/JMkHHyBTNqGMsPavyvW4jq1rmj+pRAcSW8RiSiOAjrrjAmv
         nbbOkG7JdoMyshj1zlrix3RkQCM5z7qb5h25ajIytmSQGy1rkmwkbPOJIYWxJHw5dF
         bO+Vjc3vDQ+mXZgrmN1wc1lkavcj2oqTGrYIMhvfPkfyo7eOO5tx+ipdCLy5t1KHos
         XziWl/MyQk8cRXpbZCZmQqeYc+XLSHfExGcGTwF8vkgqc7uf8LMUvTzfwRJUF6DpGD
         LmGgci0rHaoZg==
In-Reply-To: <20221009053950.be64bd6555d9c7060e363136@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Saturday, October 8th, 2022 at 21:39, Kerin Millar <kfm@plushkava.net> w=
rote:
> Firstly, for reasons of efficiency and atomicity, you should compose a co=
mmand stream that is executed once by nft(8). Here is one example of how to=
 go about it.
>=20
> {
> echo "add element ip filter doh_ipv4 {"
> curl https://some/ip4.list | paste -d, -s -
> echo "}"
> } | nft -f -

Thanks for that.  An earlier version of my script built a single blob comma=
nd similar in function to that, but I stripped it down in my email examples=
 for clarity.   I will cherry pick your example and clean up my code.

> As you pointed out, there does not appear to be any way to "update" other=
 than in the packet path. One applicable kludge would be to enable auto-mer=
ge, along with the interval flag.
>=20
> table ip filter doh_ipv4 {
> type ipv4_addr
> flags interval,timeout
> counter
> auto-merge
> timeout 3d
> }
>=20
> Given such a set, re-adding an existing /32 will reset the timeout to 3d =
(the timeout need not be specified by the add element command). Unfortunate=
ly, its counters will be reset to 0 also, so this method confers no advanta=
ge over keeping the set as it currently stands and, instead, incorporating =
a flush command into the stream conveyed to nft(8).

Aha, I hadn't realized that you could use intervals with auto-merge like th=
at, this does open up some possibilities.

> In summary, I think that nftables would need to be changed in order to su=
pport your use case, and that it ought to be.

Yeah, it seems to me that this is simply an oversight.

My current experiments are playing with adding a dummy rule, updating via t=
he in-path solution via a netcat packet, then deleting the rule.  We'll see=
 how it goes.

nft add rule ...   upd dport 12345   update @doh_ipv4 { ip daddr expires 3d=
 }  drop
for ip...
   nc -4 -u $ip 12345
nft delete rule ...

Eric

