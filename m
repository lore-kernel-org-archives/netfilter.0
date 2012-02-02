From: Guido Anzuoni <ganzuoni@gmail.com>
Subject: Re: Hanging outgoing connections while incoming are OK
Date: Thu, 2 Feb 2012 08:48:58 +0100
Message-ID: <CACP6TAiwyGXZqYHG40TrsEaKr7sAKKAO+A5Z7a=DMVcf3iO4ng@mail.gmail.com>
References: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
	<1328031477.2018.12.camel@andy-laptop>
	<CACP6TAghHWG2zHfGkPuac2o-qZbuwQHXqddyhUGx3Lwvuch5SA@mail.gmail.com>
	<1328122709.1891.11.camel@andy-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=v97zZuzgo77v5c5rXhMmKKuKnT7qTVr9bPz7sp2kh5c=;
        b=PaDaQ3ie2ipGgNjmxmnk8bB0T4SuqYliAW01msfFFb9T+PFOPtkzBq0zzOOqspFNpX
         pVNt3TMVSbbV1wgSncKLEHh/RgGtwFD80vB3NXjID8MOtV1TcICaTr6tST4cUJ9br1r8
         DZNx6XNUj0P6W6gNVy5iQT6w+pLF8/b8JLmkk=
In-Reply-To: <1328122709.1891.11.camel@andy-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>
> Which would explain why you are seeing this.
>
> Why not just have one public IP address on eth0 only? And then use th=
at
> for incoming and outgoing connections, at least until you've got it
> working?
>
> Something like:
>
>
> [Internal
> =A0interfaces] =A0 __________
> --------------| =A0 =A0 =A0 =A0 =A0|eth0
> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0Linux =A0 |(PUB_IP_INCOMING only)
> --------------| =A0 Box =A0 =A0|------------------------->ISP Cisco r=
outer
> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0| =A0 =A0 =A0^
> --------------|__________| =A0 =A0 =A0|
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SNAT here=
 to PUB_IP_INCOMING
>
> Andy
>
>

=46irst, sorry for the top-post, I just start typing without thinking..=
=2E..
Yesterday I have tested your setup simply assigning one public address
( I have 6 addresses) to a machine on the network
and another to the router but the problem is still there.
I think that ISP should monitor the external interfaces of both router
to check if and when packets come in.
Anyway, I don't want to bother netfilter users with connection
problems that are out of scope.
The much more specific question is: in order to correctly perform SNAT
and DNAT, is it necessary to bind the referenced addresses
to some interface ?
I think the answer is no, it is not necessary, but I would like to
have a confirmation on that.

Guido
