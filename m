From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Kernel Module Chaning destination mac address
Date: Tue, 3 Apr 2012 17:17:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204031717150.27251@frira.zrqbmnf.qr>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com> <CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com> <20120402170117.10d359c8@s6510.linuxnetplumber.net> <alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
 <CA+EzgVQHBbCW+RPCATCQQrNXhY+sOuR7Z0zbo1ykd+Yjh=SRCw@mail.gmail.com> <alpine.LNX.2.01.1204031612240.15235@frira.zrqbmnf.qr> <CA+EzgVQS7E1pXgkOK0A5-FUD6h6Wagx6viqC98biPa2tzzHpfQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+EzgVQS7E1pXgkOK0A5-FUD6h6Wagx6viqC98biPa2tzzHpfQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Cc: netfilter@vger.kernel.org

On Tuesday 2012-04-03 16:56, DIGVIJAY SINGH wrote:

>Hey Jan,
>Thanks for the quick reply. However from the link the TEE target sends
>clones all the packets and sends it to a required destination address.
>However they will just reach the destination and go into user space.
>But like I said
>>I need to redirect all my outgoing traffic to different pcs over the lan.
>>(The thing is that of all the pcs which I have selected only 1 of them
>>should receive one packet). These pcs will direct all my traffic to the >required destination.
>I need to only <BOLD>route</BOLD> my traffic through the specific PCs.

Right. If you only need routing rather than cloning, use `ip route` to 
configure it.
