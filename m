From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Assigning multiple marks to a packet
Date: Wed, 31 Mar 2010 15:36:07 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003311533570.25555@obet.zrqbmnf.qr>
References: <u2xd99c4e221003310622h70e761au368f0361dee9c382@mail.gmail.com>  <alpine.LSU.2.01.1003311527390.25555@obet.zrqbmnf.qr> <p2qd99c4e221003310633i981a18fbt73186b6048369266@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <p2qd99c4e221003310633i981a18fbt73186b6048369266@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tiago Alves <alvesfonseca@ibest.com.br>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-03-31 15:33, Tiago Alves wrote:

>Okay.
>
>So, does it mean that also allow me to check the assigned marks based
>on binary masks besides the exact value?

>> It does allow you to set any of the 32 bits of a mark individually.

>>>I was wondering about assigning multiple marks to a packet. I have an
>>>iptables firewall that already mark some packets according to certain
>>>patterns. However, I would like to assign another mark to the packet
>>>without overwriting the previous marking.
>>>Does iptables allow this kind of setup?

As seen on TV/manpage. (Yes.)


-- 
N.B.: Fighting top-posts with random permutations of correspondence.
