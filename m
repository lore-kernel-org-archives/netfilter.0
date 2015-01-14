From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: TAP interface and iptables forwarding/nat/masquerading
Date: Wed, 14 Jan 2015 11:31:41 -0800
Message-ID: <CA+HxBU+vzVOhY-iCMty=87Mo3yMnzo5Lw=x5E54D3Rud4GXSTA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=/Mi6/QCSElHzvSQB218kAacH0J6tjcp0e5+x2bJGT3M=;
        b=EGWvZYc/Wk0yXnUFQP/DgRfyrtLtoBPJLiNniM3MzL2NUEWjwSyhZALZPXXSNDVHeY
         rdwRO7E6VWHVnY38CMBQ3IiWDp239P+vyW61AVzPYyCmTDSCIuxC4pmiptOr8SRd3UCl
         d5QkLkmJv01KGevH9UKzoqHEo4qZ36vzR8v1UfJK/RIXp0mov7XcTKpM3DfIKzzyRzsM
         sx6FmiYu4Ak5T48JhEcM/l6WOCMJXArCOkUbjkglfdcfkJgpJvqmkGbRjIEXqh3600zE
         7X851lQ2WrNAJUlPZAYYnN7CRKJw0Kxib5rNHFrhs8fPzQVHgUykMLy0zf/MhOak4AFM
         YU0g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

If I bring up a device alias like this:

> sudo ifconfig eth0:test0 10.0.1.1 netmask 255.255.255.0

=2E..then use these few simple iptables rules:

> sudo iptables --table nat --append POSTROUTING --out-interface eth0 \
>     --src 10.0.1.0/24 --jump MASQUERADE
> sudo iptables --table filter --append FORWARD --match conntrack \
>     --ctstate NEW --src 10.0.1.0/24 ! --dst 10.0.1.0/24 --jump ACCEPT
> sudo iptables --table filter --append FORWARD --match conntrack \
>     --ctstate RELATED,ESTABLISHED --jump ACCEPT
> sudo iptables --table filter --policy FORWARD DROP

This gives me a working home router with nat/masquerading capability.
All is good.

But if instead of creating an alias with the ifconfig command, I
instead use a TAP device opened up from some C++ code with the same
10.0.1.1/24 address, I don't see any traffic coming into the TAP
interface.

What I eventually want is to have a user-space C++ application that
can examine traffic, and make decisions on what traffic to drop,
modify packets, or packets to log.  Then that C++ application sends
the remaining packets on their way.  Is it possible to use iptables
for this?

Thanks for any help or pointers.

St=C3=A9phane
