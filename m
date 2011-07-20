From: Ryan Whelan <rcwhelan@gmail.com>
Subject: Re: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 16:13:52 -0400
Message-ID: <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
	<alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=fFoyM+jikW/K5VCCMHQNy4+HYFEFkx2rHTX9iJDMKmw=;
        b=x3cp5vtmXfmNgfldFbO3EvhBwu3B2doLprTV15NXGm4ltRekmnHGKLN+zU76FFI+dW
         yzustEx8YTeCWrmthHIvlEEd6Rww8cflKJl2no2fFbbiUv1oFxwyeyhk03zi2vsk1IC5
         4fsj4fQHTJ8LsEWTN7ZV9kLrxlyx9lL0mw5GI=
In-Reply-To: <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wed, Jul 20, 2011 at 3:56 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Wednesday 2011-07-20 21:20, Ryan Whelan wrote:
>
>>I have IPSec setup between 2 hosts and would like to stop all
>>inter-host traffic thats not secured with IPSec (They have a GRE
>>tunnel between them, and I want to be sure the GRE traffic fails to
>>transmit if the IPSec daemon fails)
>>
>>iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
>>iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
>>iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
>>iptables -A OUTPUT -d hostB.example.com -j REJECT
>>
>>The reject rule is rejecting all traffic to that host[...]
>>If i remove that rule, everything works and i
>>see the packets get counted on the ESP protocol rule.=A0 I thought th=
e
>>rules were processes in order until a match was found. Clearly I'm
>>wrong.
>
> They are indeed processed in order, and until a match is found --
> and match _was_ found (packet which has dst=3DhostB, which is not
> ESP, and which does not have tcpudp-500 in its headers).
>
> A `ping hostB` would match the criteria of this 4th rules, as would
> opening http://hostB.example.com in a browser, for example.
>

but if i remove that the last rule, the 3 rule starts counting matches
(the ESP protocol rule). If that rule matches, why does it continue to
look at rule 4 if rule 3 matches?
