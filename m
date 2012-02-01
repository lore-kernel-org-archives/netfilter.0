From: Guido Anzuoni <ganzuoni@gmail.com>
Subject: Re: Hanging outgoing connections while incoming are OK
Date: Wed, 1 Feb 2012 16:40:00 +0100
Message-ID: <CACP6TAghHWG2zHfGkPuac2o-qZbuwQHXqddyhUGx3Lwvuch5SA@mail.gmail.com>
References: <CACP6TAgii5i3rjuZHZaC=23ZN_FqFyXcigCj9MMcYkGXYgk-1A@mail.gmail.com>
	<1328031477.2018.12.camel@andy-laptop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=IJg7cB6FX7IlGAhOzH8PdRiXFZlBwdNPxS+gqgnOQa8=;
        b=R9mbP0ViLC24S++IJ0ZiN5HCn90QRGL1Bv5cVUQOngsN4X2Zqa9oye3okaPa8YyLWM
         NcTi0GYwNoUh3fEF5vb2Yr5kN6fjjRHKMwygHaWFZmmk1UobZVtUKY03E2OZ7RGa1tYL
         iVjrKokNeB3AVYm7JUg9vRqCY61xQSwDtkAXs=
In-Reply-To: <1328031477.2018.12.camel@andy-laptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

OMG, sorry.
The intended setup was
fw eth0: 10.254.254.1, PUB_IP_INCOMING, PUB_IP_OUTGOING

I have used 1 public ip for incoming connections and 1 ip to
"masquerade" outgoing ones.
I don't know if it is necessary to bind public ip to some NIC in order
to let netfilter NAT work properly.

Anyway, there is a little progress in the analysys.
Starting a ssh session from a linux box on the internal network, I can
see with tcpdump a certain amount of packets
flowing along the path from the linux box, the firewall up to the ssh server.
Then packet flow stops for 10-20 seconds until final exchange takes
place and I have the shell prompt.
It seems like some packets start going round and round before arriving
to destination.
In fact, if I do several ls -l connection hangs again.
The strange thing is that there is no way to setup a connection if the
client is putty on a windows client.

Guido

On Tue, Jan 31, 2012 at 6:37 PM, Andrew Beverley <andy@andybev.com> wrote:
> On Sat, 2012-01-28 at 09:39 +0100, Guido Anzuoni wrote:
> ...
>> fw default gateway: 10.254.254.2
>> fw eth0: 10.254.254.1, PUB_IP_OUTGOING, PUB_IP_OUTGOING
> ...
>> My doubt is about eth0 configuration where I bind multiple addresses,
>> an internal one and all the public assigned by the ISP.
>> Is it a correct setup ?
>
> Unless I'm misunderstanding something, this does seem like a strange set
> up. Why not just have the one IP address on eth0? Do the Cisco routers
> also have an external IP address? Are these 2 completely independent WAN
> links? If so, how is traffic shared between them?
>
> Sorry for all the questions, but I'm not entirely understanding your set
> up and what you are trying to achieve.
>
> Andy
>
>
