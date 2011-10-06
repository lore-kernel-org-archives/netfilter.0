From: Prashant Batra <prashant0100@gmail.com>
Subject: Re: ip6tables support for filtering sctp packets with specific ports
Date: Thu, 6 Oct 2011 21:44:37 +0530
Message-ID: <CAG+XuE5TXknTyie3qmAnV1msD-fe5-NqevYGOVKG6xqkFhBnGw@mail.gmail.com>
References: <CAG+XuE607ciut+hUOMUvE_5h98fE4xf7J48Oc9ecanGrFKhvoA@mail.gmail.com>
	<alpine.LNX.2.01.1110061741130.22969@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=OCX024k+wp3iAmbQr5UcOpxxFoh15XmmWSRvR5RVnVQ=;
        b=R7oVNrWo+PSNXiSn8JeGItdmiTBqGV0iArObKHxNfQWjGdHHE7X6aLpU2Ml1U5804g
         kjRQ3dn42tpBLiWBwkg7U2WeA2VSDQqiRj1svu48LL4C0rc1ItkpJt41PbwofIGWkD3j
         nYvDyjQ761qtOa5CsBXv9VJpH63f8nFPw7De0=
In-Reply-To: <alpine.LNX.2.01.1110061741130.22969@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

This is what I am getting-

#ip6tables -I OUTPUT -p sctp --sport 3232:65535 -d 2001:db8:0:242::36
-s 2001:db8:0:242::37 -j QUEUE
ip6tables v1.3.6: Unknown arg `--sport'
Try `ip6tables -h' or 'ip6tables --help' for more information.

#ip6tables -I OUTPUT -p udp --sport 3232:65535 -d 2001:db8:0:242::36
-s 2001:db8:0:242::37 -j QUEUE
executes just fine and ip6tables -L shows,
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
QUEUE      udp      2001:db8:0:242::37/128  2001:db8:0:242::36/128udp
spts:3232:65535



On Thu, Oct 6, 2011 at 9:12 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> On Thursday 2011-10-06 16:44, Prashant Batra wrote:
>
>>Hello,
>>
>>
>>I am trying to achieve sctp(ipv6) packet filtering using ip6tables.
>>I have tried to use the following-
>>
>>ip6tables -I OUTPUT =96p sctp --sport 3232:65535 -d 2001:db8:0:242::3=
6
>>-s 2001:db8:0:242::37 -j QUEUE
>>
>>Can someone help me on this?
>
> It helps to look at the error message. And using - (U+002D)
This is what I am getting-

#ip6tables -I OUTPUT -p sctp --sport 3232:65535 -d 2001:db8:0:242::36
-s 2001:db8:0:242::37 -j QUEUE
ip6tables v1.3.6: Unknown arg `--sport'
Try `ip6tables -h' or 'ip6tables --help' for more information.

#ip6tables -I OUTPUT -p udp --sport 3232:65535 -d 2001:db8:0:242::36
-s 2001:db8:0:242::37 -j QUEUE
executes just fine and ip6tables -L shows,
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
QUEUE      udp      2001:db8:0:242::37/128  2001:db8:0:242::36/128udp
spts:3232:65535
> rather than =96 (U+2013) near "-p".
>
Not sure what you mean by (U+2013)


-- Thanks
Prashant
