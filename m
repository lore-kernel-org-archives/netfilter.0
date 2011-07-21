From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 20:09:15 -0400
Message-ID: <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
	<alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
	<CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
	<alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
	<CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
	<alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=sSOCtwGJt8xJjzFNxciOfSoCg0XMmHoZHz9TJo41UQs=;
        b=e+ly5pMFrpSxkxJKFFralxKj804ts0mWUdL40EydcOcpUMJ/9ErbM8jWCiBEdCOhCX
         +5E5wAYkQfayKkplZ6lMyQCVu5jPcB4va1DopAsDfR9AJt9TNIkZqr+W+EVDJyO7Y74W
         FMNytOkvPISVRm76rMH4HUtbwkJMZvSvXznK8=
In-Reply-To: <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wed, Jul 20, 2011 at 4:34 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Wednesday 2011-07-20 22:33, Ryan Whelan wrote:
>>>>
>>>>iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
>>>>iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
>>>>iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
>>>>iptables -A OUTPUT -d hostB.example.com -j REJECT
>>>>
>>>>but if i remove that the last rule, the 3 rule starts counting matches
>>>>(the ESP protocol rule).
>>>
>>> Sure, because once you are not dropping the original packet in rule
>>> 4, it has a chance to get encrypted, show up as ESP, and match rule
>>> 3.
>>
>>So the outbound traffic is being processed by netfilter before getting
>>wrapped by IPSec?
>
> Both before and after.
>

Is there a way to accomplish this? Maybe a way to only accept a
non-esp packets if it destined for the ipsec stack; is that possible?
The only other recourse I can think of is dropping on the receiving
side any non-esp packets.  Thats better than nothing, but I'd like to
not send anything unencrypted if possible.

These machines will be forwarding more traffic than they originate.
Should I put this filtering on the `mangle` to catch both forwarded
and sent packets?
