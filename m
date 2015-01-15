From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: Re: TAP interface and iptables forwarding/nat/masquerading
Date: Wed, 14 Jan 2015 16:16:56 -0800
Message-ID: <CA+HxBUJ81GNZuzweK_KGn+cjs1ho2URZPjLKVF8XOpoOrhPjGQ@mail.gmail.com>
References: <CA+HxBU+vzVOhY-iCMty=87Mo3yMnzo5Lw=x5E54D3Rud4GXSTA@mail.gmail.com>
	<54B6E620.9070800@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=9BLMjNJu2R3hf7YDX5/R8yRKpe265hAkMeEkS5b0zPY=;
        b=KJaMGCksLXeqhh8vz0aLmnJNNrEJEpamc0T9IpegiKHcATULYtBUFy30//pCd+18lQ
         W2ya46WcBMTW7vXrUTTpMf6eIs6nApx3hYfMbspCsA7/v/aB7TDzF3kNTIAIIHBHx0nF
         zjMsVMUusCoDHyXZguJnSoFUZoq+5ig/TsyYyLQ3jPvnmyOGyGc+iKGjNt5dA4clmEev
         PbFPX5l9iijTNBAVnX+WEJGB424H73SXzSmtDfQYZpHh3iUzLB7wZGYjQZrN12/iRIWC
         jFjlpu96FG5iQC7zy2YhXI8x90Vvgf0K40/yzeHDWx899Deps1nS9pz+z9GSwEctrBvo
         ya9g==
In-Reply-To: <54B6E620.9070800@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Wed, Jan 14, 2015 at 1:56 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> St=C3=A9phane Charette a =C3=A9crit :
>> This gives me a working home router with nat/masquerading capability=
=2E
>
> IIUC, this acts as a "stub" router routing between two networks on th=
e
> same interface. Correct ?

Yes, I have one interface connected to my cable modem which DHCPs a
192.168.1.x address, and I'm using the alias (or the TAP interface) to
bring up a different 10.x network for my local machines.

>> But if instead of creating an alias with the ifconfig command, I
>> instead use a TAP device opened up from some C++ code with the same
>> 10.0.1.1/24 address, I don't see any traffic coming into the TAP
>> interface.
>
> How do you send trafic through the TAP interface ?

This is the part I'm thinking I did wrong.  How should I get traffic
to flow through the TAP interface?

When I bring up an alias and give it a 10.0.1.1/24 address, all my
other machines are set to use 10.0.1.1 as their router, and everything
works.  All traffic goes to that box, and using "sudo conntrack
--dump" I see all flows.  But when I try to use the TAP interface
instead of the alias, no traffic is flowing through the TAP.  I'm
guessing there is some tap/route/iptables magic needs to happen so the
TAP interface with a 10.0.1.1 address can be seen?

>> What I eventually want is to have a user-space C++ application that
>> can examine traffic, and make decisions on what traffic to drop,
>> modify packets, or packets to log.  Then that C++ application sends
>> the remaining packets on their way.  Is it possible to use iptables
>> for this?
>
> You may want to check the QUEUE and NFQUEUE targets.

Ah!  Thank you for that hint.  My iptables man page (on Ubuntu 14.10)
is incomplete, and I didn't realize what NFQUEUE did!  Just did a
google search for it, and wow!  I think this may be exactly what I
need.

St=C3=A9phane
