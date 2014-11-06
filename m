From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Thu, 6 Nov 2014 10:10:40 -0500
Message-ID: <CAPJdpdCmNBo3phPuG_QAnDJPt4XCeUd7RAQCbp8Mk6mJat0J3Q@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
	<CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
	<545B6CF8.9040603@heinlein-support.de>
	<CAOkSjBjSZYdunZamL7ukyOGnSWqqmhDfmpuAhBrqCAgso60a6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=1gUOHYhuiZnDkmSNlkM0mYbAZ/FMgKgeYGqWQ14o8t8=;
        b=VhCT8W9MlycFvT5agRSmnZwsajTshUPlQbJ73pI2RzxpnhDcKBwSsZquzAV4XWbCYq
         /VoTeRzJkevj0Wx8+M/gim2VTqGOusz8pHab4zurHJzaZHBthpE/RhSykcmhZZ7ROdhW
         Sms3dnUPwILftZwT48DmMajWaa6f2wzzY2igF8bNDaN3+9T/8NadiMYCZT6KKdEZX61M
         XNb1S4zv1qGriYQVcUN0QLHOQfO/+AxkIJqkgXbC/7tD7f5CIBfLjJwF/hNrw3duV0AN
         vD58m7aksTV0lsHysEf/QzQO5qXTPTh5wWrK4QwjwkdkdM3nnj8nfyYlG3BRv4G8XK0E
         Fq+Q==
In-Reply-To: <CAOkSjBjSZYdunZamL7ukyOGnSWqqmhDfmpuAhBrqCAgso60a6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Robert Sander <r.sander@heinlein-support.de>, netfilter <netfilter@vger.kernel.org>

I saw no mention of squid in this string but its not that difficult
why not use a stock Nagios probe script with a wrapper. thats what I
usually do if need to get a check script working in a hurry.

Also different environment have different requirements as far as speed.
In broadcast video a a second is an eternity when millions of dollars
can be lost for every frame of video lost in a commercial.
In stock exchanges they care more about consistency than speed. while
speed is good they are more concerned that its reliable and the
latency is precise and equal to all the traders until it leaves the
exchanges network.
By contrast hedge funds want reliability but are primarily concerned
about speed (as in low latency not necessarily high bandwidth ) so
they are often willing to try bleeding edge technology even if it only
shaves a nanosecond off the latency when  getting to the exchange
gateways.
In web a user waiting a couple of seconds may not be great but its
usually hidden from the user by some sort of loading screen that makes
the user think that somethings happening. In addition if its a one
time unusual glitch in the session users will usually blame it on
thier device or internet provider.
In many standard desktop environment most IT departments wont care if
the internet is down for 30 seconds during a fail over event.

fail overs in keepalived are nearly immediate on a clean shutdown and
3 times the polling interval on a failure. The minimum interval is 1
second but there are several patches out there for faster intervals.

Using a version of keepalived I hacked I was able to get the VRRP
interval down to 1/10th of a second with no apreciable impact. My test
at 1/100th of a second basically ate a whole CPU core but worked. It
was funny at 1/100th of a second interval the VRRP heartbeats detected
a link down faster than the Kernel lol.

So it really all depends on what you are using the firewall for.






On Thu, Nov 6, 2014 at 8:21 AM, Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com> wrote:
> On 6 November 2014 13:43, Robert Sander <r.sander@heinlein-support.de=
> wrote:
>> On 05.11.2014 21:40, Arturo Borrero Gonzalez wrote:
>>>
>>> I would recommend Debian, corosync + pacemaker.
>>
>> Keepalived easily outperforms corosync + pacemaker if all you need a=
re
>> managed IP addresses and routes in your firewall cluster.
>
> Maybe, but is not the case. He needs squid and other things.
>
> I prefer using corosync + pacemaker better than manually write a bunc=
h
> of scripts to manage the HA of services. Is more scalable and robust
> from the 'services in HA' point of view.
>
> --
> Arturo Borrero Gonz=C3=A1lez
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
