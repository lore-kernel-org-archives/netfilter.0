From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: TEE in filter table
Date: Sat, 31 May 2008 10:02:19 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805311001440.4055@fbirervta.pbzchgretzou.qr>
References: <d95317090805291827h1209422bl37ef53eb720c6609@mail.gmail.com> <d95317090805291827n6fc80781wcf4078099a086a0a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090805291827n6fc80781wcf4078099a086a0a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-30 03:27, Gilad Benjamini wrote:

>The TEE target is currently limited to the mangle table.
>I need to TEE on the filter table, specifically, when forwarding
>traffic on a bridge.
>Is there a problem with simply changing the code to allow that ?

No problem. Just remove the line ".table = "mangle"," to unlock
it for all tables.
