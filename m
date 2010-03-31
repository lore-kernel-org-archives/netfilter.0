From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Assigning multiple marks to a packet
Date: Wed, 31 Mar 2010 15:27:51 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003311527390.25555@obet.zrqbmnf.qr>
References: <u2xd99c4e221003310622h70e761au368f0361dee9c382@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <u2xd99c4e221003310622h70e761au368f0361dee9c382@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tiago Alves <alvesfonseca@ibest.com.br>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-03-31 15:22, Tiago Alves wrote:

>Hi folks,
>
>I was wondering about assigning multiple marks to a packet. I have an
>iptables firewall that already mark some packets according to certain
>patterns. However, I would like to assign another mark to the packet
>without overwriting the previous marking.
>
>Does iptables allow this kind of setup?

It does allow you to set any of the 32 bits of a mark individually.
