From: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Subject: Re: Kernel Module Chaning destination mac address
Date: Tue, 3 Apr 2012 20:26:33 +0530
Message-ID: <CA+EzgVQS7E1pXgkOK0A5-FUD6h6Wagx6viqC98biPa2tzzHpfQ@mail.gmail.com>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com>
	<CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com>
	<20120402170117.10d359c8@s6510.linuxnetplumber.net>
	<alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
	<CA+EzgVQHBbCW+RPCATCQQrNXhY+sOuR7Z0zbo1ykd+Yjh=SRCw@mail.gmail.com>
	<alpine.LNX.2.01.1204031612240.15235@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=P+ctfFpp9JZcFsSkYSq7E8ND3+u9MpYGf3Q1WFM7iYk=;
        b=F13RimmZBInMy3j2bp15XN/hNV1ho0N3hSkqTdb8nChJImtoUPDK8HGVnVHfNPMYYv
         h7qvLgdBsCGamCVFOJ4qWT7r8RN5AywGt4KwjUuE2gOUqI+lPVuwPEK5uW6BCsvKR2YO
         c8lFEUXpwMlHT3xfe7hnlC6ksIDe6VjUdrxuY=
In-Reply-To: <alpine.LNX.2.01.1204031612240.15235@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hey Jan,
Thanks for the quick reply. However from the link the TEE target sends
clones all the packets and sends it to a required destination address.
However they will just reach the destination and go into user space.
But like I said
>I need to redirect all my outgoing traffic to different pcs over the lan.
>(The thing is that of all the pcs which I have selected only 1 of them
>should receive one packet). These pcs will direct all my traffic to the >required destination.
I need to only <BOLD>route</BOLD> my traffic through the specific PCs.

Digvijay
:D

On Tue, Apr 3, 2012 at 7:48 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
> On Tuesday 2012-04-03 15:15, DIGVIJAY SINGH wrote:
>
>>[...] I'll have to work my way on the Layer 2. So
>>arptables is probably the best way to do it.
>
> If you think so...
>
> Meanwhile however, ARP is layer-3.
>
>>This is what I have my eyes set on right now. xt_TEE seems
>>interesting. Should I switch over to that instead?
>
> I do not see a reason why one would want to reinvent the wheel.
>
>>Could you describe in detail as what procedure I need to follow.
>
> I suppose - it's inevitably more reading for you. See
> the manpage of iptables for a start. And
> http://www.bjou.de/blog/2008/05/howto-copyteeclone-network-traffic-using-iptables/
