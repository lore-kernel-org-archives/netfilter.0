From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: dropping UNTRACKED packets, breaks IPv6 - why?
Date: Fri, 26 Jul 2013 09:07:18 +0200
Message-ID: <CAOkSjBggVWoGj-Kin3fwDx+1pjpHyB2MSxna86-X7ik90iSeQA@mail.gmail.com>
References: <1374803962.5489.12.camel@fermat.scientia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=wxvoO5tcggCOiLaCVVsOgkVq6oJT160Q+CPKC7Dk3X0=;
        b=AB6FiuVboqFn9WrYuHZtEnvNp5eVmlXFvBKsVRtf3YGciHaOydbPAP33/QLSELGKNg
         EJQ7ynB64mWQWUmJhNeRwG3+Fkru5HCC/iey2HEjMXKcrYVuZDJOQ/BdGs1NJX8WNItD
         inKYlXlDMse4PkP+TFRz+xvyNuraOfFve337AQSyUfUi7RFdkjmqQDhxRCxZgbVmpGq9
         gvLpe0trX8dsiaqEn3MNAxotnvSlL3Is65cMiAnHS5w4vmTlL2qW6FaHnMIzIB4HLDqI
         N0ZFnYLNBug27YCvzVgNmlQGFM4OgNskMxGyO0FhTXu5imSfy1Zc8gJi3RE7kanQ5jn/
         43qg==
In-Reply-To: <1374803962.5489.12.camel@fermat.scientia.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter <netfilter@vger.kernel.org>

On 26 July 2013 03:59, Christoph Anton Mitterer
<christoph.anton.mitterer@physik.uni-muenchen.de> wrote:
> Hi.
>
> I usually have some default rules in place on all nodes which look ab=
out
> like this:
> ---------------------
> -A INPUT        --in-interface lo       -j ACCEPT
> -A OUTPUT       --out-interface lo      -j ACCEPT
>
> -A INPUT       -m state  --state UNTRACKED     -j DROP
> -A FORWARD      -m state  --state UNTRACKED     -j DROP
> -A OUTPUT      -m state  --state UNTRACKED     -j DROP
>
> -A INPUT        -m state  --state INVALID       -j DROP
> -A FORWARD      -m state  --state INVALID       -j DROP
> -A OUTPUT       -m state  --state INVALID       -j DROP
>
> #handle IPsec only sources/destinations
> #snip/snap
>
> #allow incoming packets for all established and all related connectio=
ns
> -A INPUT        -m state  --state ESTABLISHED,RELATED   -j ACCEPT
>
> #allow incoming ICMP packets
> -A INPUT        --protocol icmpv6       -j ACCEPT

Could you provide a ip6tables-save format ruleset?

> ---------------------
> And the same for IPv4.
>
> The idea with dropping the UNTRACKED/INVALID was that such packages a=
re
> probably not good fellows and should stay out...
>
> Okay... now with IPv4 everything works as expected...
>
>
> But with v6 nothing works at all and I get Destination unreachables
> (even on pings)... I can't even reach the gateway.
>
> When I disable dropping the untracked packets... it starts working,..=
=2E
> even when afterwards I enable it again.
> Seems that there is some connection between the host an the gateway
> shown then by conntrack.
>
>
> Now... question is why?

What is the default policy? I guess you are not allowing ICMP messages
in OUTPUT. ICMP messages are important in IPv6.

Regards.

--=20
Arturo Borrero Gonz=E1lez
