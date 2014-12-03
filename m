From: Jean-Philippe Menil <jpmenil@gmail.com>
Subject: Re: nftables compatibility
Date: Wed, 03 Dec 2014 08:30:52 +0100
Message-ID: <547EBC2C.1030503@gmail.com>
References: <547E38AE.6000909@gmail.com> <1417558548.10146.7.camel@regit.org>
Reply-To: jpmenil@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=GFwKHdto+NmTK3KvMI8ze1GwjsEzu/KNU3xT25MZUdI=;
        b=BuzvqJJJtxt8apa++biQxm6snKrG1ZNWmWcZg7qkKaMBCAmf7B/5lwvp3rVtvA/I68
         SVkAuvOOUf/6w7OR1RdKsDACO5q5A6jMLV84k+D25ykBlUzKxEytXzgNpRlZ3yK8vecD
         vMRJyaQL83ewNvdlfKvsAbcDR4Ts2nnqD5mrasBMvMwFgdPR+3i3ztihAep4tQZDn3wI
         OsL7Cxkowfk2GkKUTH+P3swVHmAL7ySovs6Q4foFOyJ2Eqwcbafhg4tcDs0G+Ywi3Znl
         3gHRzC4ej9S6kmagJoMX53y1JHIGZQV2n+Szww8EKFZ2tZiB8exJUK174zJdfYrrlSrK
         veLA==
In-Reply-To: <1417558548.10146.7.camel@regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

Le 02/12/2014 23:15, Eric Leblond a =E9crit :
> Hi,
>=20
> On Tue, 2014-12-02 at 23:09 +0100, Jean-Philippe Menil wrote:
>> Hi,
>>
>> while playing with nftables, i observe that my iptables masquerading=
 do not
>> work anymore:
>>
>> modprobe nft_nat
>> modprobe nft_chain_nat_ipv4
>> nft add table nat
>> nft add chain nat postrouting { type nat hook postrouting priority 0=
 \; }
>>
>> ^^ iptables nat stoped work here.
>>
>> I'm sure i read that nftables and iptables  where compatible.
>>
>> Can anyone point me what am i missing ?
>>
>> (I'm on 3.17.4)
>=20
> Sadly, masquerade is requiring 3.18. Only standard NAT is implemented=
 in
> 3.17.x.
>=20
> BR,
>=20
Hi Eric,

thanks for your response.

I've see on the wiki that masquerading require a 3.18 kernel.

But why juste adding the type nat hook with nftables, broke the iptable=
s
masquerading?

There's no problem at all, i will upgrade to 3.18 for my tests.

Best regards.
