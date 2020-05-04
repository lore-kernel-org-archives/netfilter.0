From: Lazuardi Nasution <mrxlazuardin@gmail.com>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 4 May 2020 15:54:41 +0700
Message-ID: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=BvXxGR1hSnVKBtnmRCJmO9Zgom9fPvImWxDV7gh0hjo=;
        b=h2H9OA4xBu/uupl6biu3bAJpqikKUEyK10NpQ8iIfceCmrD624a7nUQCO7kiIUnexu
         LyzA1bXjC3A1eA1bPfeMBtUYJUOXs9R3B3JZCTsEHjBLAhWGypyPQMk5m8pN5Kelgd5x
         CbMJdw5P5KrqLqK/b+kgFO/vlfVHQ3LbGr0cgHJxoZLwdgjgISRnF+gcWiNyr1sm9ryC
         90ol7+u7SQROX8RJCBDzYNKcc71u0y1CoGjt3by1Glk2kJ1R6Djgyb9KHb0l2oxHFJSL
         xlfCl7QnQjBA0QUk0RXPIDs+sLm+jqlZue17eob7vLnjvdqwsYf11FEmd3BpYCVGGnv8
         fbMQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>

Hi,

YouTube use SSL. So you can't match strings inside the packet, it is
encrypted.

Best regards,

On Mon, May 4, 2020, 15:40 S=C6=A1n =C4=90=E1=BB=97 <sondd1096@gmail.com> w=
rote:

> I have a Linux router and using iptables 1.4 to configure the firewall.
>
> And I want to permit a device to access a certain website with a
> domain name and block other websites. So I have use some cmds in
> iptables below:
>
>
>
> iptables -N allow_chain
> iptables -A FORWARD -j allow_chain
> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -m
> string --algo bm --string youtube -j ACCEPT
> iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -j DROP
>
>
> In this case, I want computer with MAC address 11:22:33:44:55:66
> connected to my Linux router can only access the youtube . But the
> result was not my expectation, after I apply those rules , my computer
> cannot access to youtube and other web also, it drop all internet
> connection . In my understanding, the rule with ACCEPT target was not
> apply even the package match with the condition, and all packages are
> handled in the rule with DROP target.
>
> So is there any thing wrong with my cmd? What was the problem ?
>
> Please help me, Thanks.
>
