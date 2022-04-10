From: =?UTF-8?B?Q8OpZHJpYyBNYXJ0w61uZXogQ2FtcG9z?= 
        <cedricmartinezcampos@gmail.com>
Subject: Re: ebtables complains about the speeding up example
Date: Sun, 10 Apr 2022 18:07:51 +0200
Message-ID: <CAMjZu9NDPhWAy0UAUY5QDmJL9tmkOMuXJvcspaq3tcq6EYP60A@mail.gmail.com>
References: <CAMjZu9NUzT__WUyb0jzX=oeAiJrzp6oaPJwY=UHwN_PDhPtBiw@mail.gmail.com>
 <YlL2wNZ9badE33qi@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDzv4cbxKCdgXOAuZ9K0pySaQ6a2hCXxhA3QdhYJP8w=;
        b=nW2TtSF9Uzt9l3t5wUtI4qFSwpepNXaEDAa3gRFXk51B8KdPZeIU9mFGnR8erm95Ej
         d1wDkaOTcpc4cix6tDY8acrWijpQb7xaCEE0XE98hVL+ER1tpwY2eKKz6KqwuofbbjsQ
         PjZCMLA+8+KiJhE+mGl84D16ON3xrRQ3eZkqbbgiwyzAYLQTkjayS4huegoo8vLjvyQR
         8LyJIQavrMrOBW95uOaXGnTInmBH/90FpjfaC/yH6qcZe9phDH3nZqhkBgmx4YxE24P8
         XZ6EeUlQSapBknbP1JIdhT96I1E2Glo96XN8qAGSxWEABLgIy0+QlRF1sPNsM9R8tpu2
         +dAQ==
In-Reply-To: <YlL2wNZ9badE33qi@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Sun, Apr 10, 2022 at 5:24 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Where is this documentation? If you could point to the URI, I can
> update it and remove it.

My apologies, I inadvertently erased the link when I switched to
"plain text mode".

http://ebtables.netfilter.org/examples/basic.html#ex_speed

This link and the information has been shared for years on the Internet, e.g.:

https://wiki.archlinux.org/title/Network_bridge#Speeding_up_traffic_destinated_to_the_bridge_itself
https://serverfault.com/questions/927213/linux-speeding-up-traffic-destinated-to-the-bridge-itself

So, if the command or the related info are wrong, I think it would be
wiser and kind to update/correct it instead of removing it. I however
think that it is incomplete and my lack of xytables skills prevents me
from solving this problem by myself.

On Sun, Apr 10, 2022 at 5:24 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> What is your usecase? Or maybe you just found that documentation and
> you added this rule?

I have set up a RPi as WAP on ArchLinux (I've created a bridge br0,
bridged it with eth0 through systemd-networkd and with wlan0 through
hostapd). As stated in the docs' example, this simple set up is not
optimal, hence the above command.
