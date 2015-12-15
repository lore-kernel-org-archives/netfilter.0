From: Scott Bronson <bronson@rinspin.com>
Subject: Re: Packet disappears after DNAT?
Date: Tue, 15 Dec 2015 04:21:30 -0800
Message-ID: <CAKmUPx7UQD0zE4ngHanfid4BN8aMFLdJ284peiW0_d8=EFW_JQ@mail.gmail.com>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
	<5662BD03.60004@plouf.fr.eu.org>
	<CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
	<56653CCC.6020603@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=gl2TZ0ynWG8YpAtHBY2h680PxonZ8vFGXICh0Rt92g4=;
        b=h2ghf2LOIbFLbDrt7y7f8AMg/+rDo81BAbGzMRPNamvke97BLHWho2Url39ReIOJMk
         UA/LkeBukOd8tiqCgH+mVRDElyKNmom/ARYfMC5FluC1V1jEfFubueIJjIxCw/hm/Z9w
         zhim5YMz8B1yhDnz23N5oVwOY51S/aEf/6Ivs45DB6HSiCULE/a7uEs42ZG5FrKFlThz
         4Y77EFI8lh5UaUFWgQzrvbw1G7CSTbw97y5cQlHT6gep9lvv3SP6xYvWOjwj6xgcRyjt
         bWJAqBZmJxVGwhZMfP6L23ivL1HO6mYrxplPMQ2VYwmp1D0Yjy3Hj54a5+0WMreSXajt
         L2BQ==
In-Reply-To: <56653CCC.6020603@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter <netfilter@vger.kernel.org>

On Sat, Dec 5, 2015 at 2:31 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> Bridge-nf is
> enabled by default and can cause weird behaviour with NAT. Try to
> disable it :
>
> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

Yes, thank you!  I never would have found that.  Without it, the
VM->Host->VM NAT
just eats the packets.


On Mon, Dec 7, 2015 at 12:01 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> You must also MASQUERADE or SNAT these packets, otherwise the reply
> packets won't be sent back to the host and be de-NATed properly

You're absolutely right.  With two more rules:

iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
tcp -j MASQUERADE
iptables -t nat -I POSTROUTING -s 192.168.122.10 -d 192.168.122.10 -p
udp -j MASQUERADE

it works!


Gotta say, unning `echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables` in my
script makes me a little queasy...  but this page suggests that no other option
will work cross-distro:

     http://wiki.libvirt.org/page/Net.bridge-nf-call_and_sysctl.conf

I guess that's still the case?


Huge thanks Pascal.

    - Scott
