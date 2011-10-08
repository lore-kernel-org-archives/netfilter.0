From: Prashant Batra <prashant0100@gmail.com>
Subject: Re: user-space ipsec implementation using netfilter_firewall
Date: Sat, 8 Oct 2011 17:30:29 +0530
Message-ID: <CAG+XuE6_B4pNuNwvtuh6HxevWXOMGcAhss2BCoOjPgsPtP0tZA@mail.gmail.com>
References: <CAG+XuE5sguwOVK1oasmD2ou8BMZEN=F333h9P0X12uHE1oLawg@mail.gmail.com>
	<alpine.LNX.2.01.1110081127180.2367@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=BU73HqP6tloETWmxovyJKbH+YwHPHjshxD5OFxPTV/w=;
        b=bDwGjNg2FI9gP1tq+3Ee7x3fyAN5jFlVx6Yl/biL9TGdUX21p/3hVZr5Tg4wOF42Z1
         XPJvqgXSgfkChoDFW8X5tN9KvrTjPeSssR+eftPm64Nkk06iMJhQaENKpsULdWrw0lJt
         Il3jTC9SkWFe0Pigl/vAL9UQMINrHmRQkWE+c=
In-Reply-To: <alpine.LNX.2.01.1110081127180.2367@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Sat, Oct 8, 2011 at 3:09 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Saturday 2011-10-08 08:50, Prashant Batra wrote:
>
>>Hello,
>>
>>I am thinking to implement user-space IPSec using NETLINK_FIREWALL
>>protocol. This is how, I am thinking to proceed-
>>
>>-Get the plain packet sent out using OUTPUT rule with QUEUE target in
>>the user space. Encapsulate the packet and send out ESP packet.
>>-Similarly get the ESP packet sent from the peer gateway, get it into
>>user space with INPUT ESP based rule, decrypt the packet
>>and send it to the application using raw sockets.
>>
>>But I have some doubts whether this will work just fine or not.
>
> _Outputting_ data to a raw socket fd is not going to make it appear in
> the _input path_.
>
The packets sent by the raw socket, has be be captured by with OUTPUT rule.
I think this will happen, but I am sure that some things will not work.
> Don't make it more complicated than it needs to be.
>
> The kernel ESP encoder/decoder works just fine.
>
Actually, I have to do it, just because SCTP over IPv6 is not
processed by the IPSec in the kernel.
Have tried to put some patches, but the kernel is not very stable after that.
I am using 2.6.38 kernel. If you have some info about a stable patch,
please help me.

Regards,
Prashant
