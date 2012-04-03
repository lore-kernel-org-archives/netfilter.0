From: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Subject: Re: Kernel Module Chaning destination mac address
Date: Tue, 3 Apr 2012 18:45:10 +0530
Message-ID: <CA+EzgVQHBbCW+RPCATCQQrNXhY+sOuR7Z0zbo1ykd+Yjh=SRCw@mail.gmail.com>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com>
	<CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com>
	<20120402170117.10d359c8@s6510.linuxnetplumber.net>
	<alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=+8TEHMlwzUdFlJKK0xyC10y1i0NOUxxfe4LWsspKMbk=;
        b=jXz3nVv0xl7/VyG9OQJUlz9PozjUoUr9wWW9o+ZsOuLQS7E8pxWXLF0UzhITJUb4bq
         csa0N2n7E1z9k/HLfcTc04en0QUZ99fuSOz8i3d/r74gBEal2U25FSWi90jzOPBX9ARD
         v4rc655kg7vkKCwz38/174mTGdErQtvBXdRBc=
In-Reply-To: <alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hey Jan,
You see I am reading so much, and finding all these different ways.
It's getting kind of confusing.  Here  is what I wrote in another
mail, which should clarify my situation:
"I have a pc in a LAN. I need to redirect all my outgoing traffic to
different pcs over the lan.(The
thing is that of all the pcs which I have selected only 1 of them
should receive one packet). These pcs will direct all my traffic to
the required destination.

This is what I have figured out: Since I need to re-direct my outgoing
traffic to different PCs I'll have to work my way on the Layer 2. So
arptables is probably the best way to do it. Secondly I need to create
a target extension which takes the first frame and sends it over to
pc1, takes the second  frame and sends it to pc2 and so on.(Obviously
once the total number of pcs are over, it loopbacks). This is
something like the nth patch in iptables but not the same.

=46inally once I build this target extension I would like to build it.
So that I can use it in arptables.
"
This is what I have my eyes set on right now. xt_TEE seems
interesting. Should I switch over to that instead?
Could you describe in detail as what procedure I need to follow.
It would be great help.

Yours,
Digvijay
On Tue, Apr 3, 2012 at 5:53 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> On Tuesday 2012-04-03 02:01, Stephen Hemminger wrote:
>
>>> I am working on a project to create a kernel module which directs a=
ll
>>> outgoing traffic from my machine to different computer in my LAN. S=
o I
>>> am starting with just trying to send the traffic to just one comput=
er.
>>> I am using the=A0NF_BR_LOCAL_OUT hook. Along with the=A0NFPROTO_IPV=
4
>>> family. But every time i run the module, my machine hangs. And I ne=
ed
>>> to reboot. =A0Please see what is the problem.
>>
>>tc action redirect already does this
>
> As does xt_TEE which, at the same time, is likely to be easier to
> handle.
