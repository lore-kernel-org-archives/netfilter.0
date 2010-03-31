From: Tiago Alves <alvesfonseca@ibest.com.br>
Subject: Re: Assigning multiple marks to a packet
Date: Wed, 31 Mar 2010 10:33:18 -0300
Message-ID: <p2qd99c4e221003310633i981a18fbt73186b6048369266@mail.gmail.com>
References: <u2xd99c4e221003310622h70e761au368f0361dee9c382@mail.gmail.com>
	 <alpine.LSU.2.01.1003311527390.25555@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1003311527390.25555@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Okay.

So, does it mean that also allow me to check the assigned marks based
on binary masks besides the exact value?

Thanks in advance,
Tiago

2010/3/31 Jan Engelhardt <jengelh@medozas.de>:
> On Wednesday 2010-03-31 15:22, Tiago Alves wrote:
>
>>Hi folks,
>>
>>I was wondering about assigning multiple marks to a packet. I have an
>>iptables firewall that already mark some packets according to certain
>>patterns. However, I would like to assign another mark to the packet
>>without overwriting the previous marking.
>>
>>Does iptables allow this kind of setup?
>
> It does allow you to set any of the 32 bits of a mark individually.
>
