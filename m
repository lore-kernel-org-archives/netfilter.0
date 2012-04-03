From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Kernel Module Chaning destination mac address
Date: Tue, 3 Apr 2012 16:18:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1204031612240.15235@frira.zrqbmnf.qr>
References: <CA+EzgVRmRwZPy5qBU6OMBW9gTsuAJYE0oU6KTAsLqExu9pCiVw@mail.gmail.com> <CA+EzgVSYf5frmum4o-M1PLqQ480uez3OUGgeis=omPoEujUViQ@mail.gmail.com> <20120402170117.10d359c8@s6510.linuxnetplumber.net> <alpine.LNX.2.01.1204031423330.15235@frira.zrqbmnf.qr>
 <CA+EzgVQHBbCW+RPCATCQQrNXhY+sOuR7Z0zbo1ykd+Yjh=SRCw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+EzgVQHBbCW+RPCATCQQrNXhY+sOuR7Z0zbo1ykd+Yjh=SRCw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DIGVIJAY SINGH <digvijay09020@iiitd.ac.in>
Cc: netfilter@vger.kernel.org


On Tuesday 2012-04-03 15:15, DIGVIJAY SINGH wrote:

>[...] I'll have to work my way on the Layer 2. So
>arptables is probably the best way to do it.

If you think so...

Meanwhile however, ARP is layer-3.

>This is what I have my eyes set on right now. xt_TEE seems
>interesting. Should I switch over to that instead?

I do not see a reason why one would want to reinvent the wheel.

>Could you describe in detail as what procedure I need to follow.

I suppose - it's inevitably more reading for you. See
the manpage of iptables for a start. And
http://www.bjou.de/blog/2008/05/howto-copyteeclone-network-traffic-using-iptables/
