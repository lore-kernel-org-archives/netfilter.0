From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 20:32:31 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>  <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>  <alpine.LNX.1.10.0806231717480.26570@fbirervta.pbzchgretzou.qr>
 <38db14850806231109p4ef2197cu48082c445fea34ce@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850806231109p4ef2197cu48082c445fea34ce@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2008-06-23 20:09, Anatoly Muliarski wrote:

>Thanks.
>I've heard about RATEEST but I didn't find any doc on it.

man iptables and iptables -j RATEEST -h, iptables -m rateest -h. It's 
not much but a start.

>-m limit does the thing but with packets and I need bytes.
>Currently I'm using somewhat ugly scheme with -m limit and an
>arbitrary constant as Average_Packet_Size.
