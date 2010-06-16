From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Fwd: Can Netfilter "mark" be used with setkey spdadd?
Date: Wed, 16 Jun 2010 20:21:04 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006162019220.30698@obet.zrqbmnf.qr>
References: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Lele <ajay.lele@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-06-16 18:21, Ajay Lele wrote:
>
>I am working on a VPN solution where packets entering Linux box are
>manipulated using IPTables rules (SNAT, DNAT etc.). The nature of this
>manipulation is such that packets destined for different sites end up
>getting the same src/dst IP address when they reach the Netfilter
>POSTROUTING chain. However a different "mark" is set using the
>IPTables mark target by which packets destined for different sites can
>be distinguished from one another. Is there a way I can use this mark
>value while creating security policy using setkey spdadd so that
>packets are sent over respective tunnels (tunnels are created
>manually)

A packet can be marked when it enters the machine and retains the 
mark as long as it exists, even across transformation.

