From: Jean-Philippe Menil <jpmenil@gmail.com>
Subject: Re: nftables compatibility
Date: Wed, 03 Dec 2014 12:02:24 +0100
Message-ID: <547EEDC0.8010202@gmail.com>
References: <547E38AE.6000909@gmail.com> <1417558548.10146.7.camel@regit.org> <547EBC2C.1030503@gmail.com> <20141203110021.GA3742@salvia>
Reply-To: jpmenil@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=0TLOJFeYXBneM/bONbXu6eXG2RvxmlYdGM9gyY/RsV8=;
        b=MNz+YiZ8b7qeN6QO2aCqrHyeKAhzUZ+UNt8xAjgTV3uXT3/DLGPJEq5QLj8qGPdlRU
         /HXs6ODxKnSACVk0ELqacJwU94TgK6Y7XO4lYT7imkrhn1w4q5ajVrDiiCPaf8+QzOC7
         Ngf+TUTUikxW6khw/Rpy8g7QCWynALvsfveszm/64ZYhhWNlSHpFcg06dEELfsnd7hkN
         MmvTzs4qBSZRhcYXs7J22YbVZ13UV5To9WhRPKhZpyN0wYDH8CMOwzmMJ+vlzwN4uCwz
         N6p9yQ4vOw3WXOz7IahStt850WkISJhRkphF9b3yjezh6eM9qJY0KqRVDz5nmXNy2h++
         3Xrw==
In-Reply-To: <20141203110021.GA3742@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

Le 03/12/2014 12:00, Pablo Neira Ayuso a =E9crit :
> On Wed, Dec 03, 2014 at 08:30:52AM +0100, Jean-Philippe Menil wrote:
>> Le 02/12/2014 23:15, Eric Leblond a =E9crit :
>>> Hi,
>>>
>>> On Tue, 2014-12-02 at 23:09 +0100, Jean-Philippe Menil wrote:
>>>> Hi,
>>>>
>>>> while playing with nftables, i observe that my iptables masqueradi=
ng do not
>>>> work anymore:
>>>>
>>>> modprobe nft_nat
>>>> modprobe nft_chain_nat_ipv4
>>>> nft add table nat
>>>> nft add chain nat postrouting { type nat hook postrouting priority=
 0 \; }
>=20
> BTW, you will also have to add the prerouting nat chain so the NAT
> engine can undo NAT for reply traffic, see:
>=20
> http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_A=
ddress_Translation_%28NAT%29

Yes, i just forget to pas in the mail :)

>=20
>>>> ^^ iptables nat stoped work here.
>>>>
>>>> I'm sure i read that nftables and iptables  where compatible.
>>>>
>>>> Can anyone point me what am i missing ?
>>>>
>>>> (I'm on 3.17.4)
>>>
>>> Sadly, masquerade is requiring 3.18. Only standard NAT is implement=
ed in
>>> 3.17.x.
>>>
>>> BR,
>>>
>> Hi Eric,
>>
>> thanks for your response.
>>
>> I've see on the wiki that masquerading require a 3.18 kernel.
>>
>> But why juste adding the type nat hook with nftables, broke the ipta=
bles
>> masquerading?
>=20
> Because the NAT engine attaches the nul-nat-binding (ie. this
> conntrack has no nat at all) when the packet leaves the chain without
> matching any rule.
>=20
> If you run iptables and nf_tables for NAT at the same time, the first
> chain will configure NAT for the conntrack, the second will just skip
> the packet since NAT has been already set up.

Ok, now i understand better.

Many thanks !
