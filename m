From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Sun, 24 Oct 2010 00:51:35 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010240051290.5145@obet.zrqbmnf.qr>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Mayo <scotgmayo@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-10-24 00:19, Scott Mayo wrote:

>I have my DHCP server setup so that it hands out IP adresses according
>to a machine's Mac address.  Is there a way to deny traffic to the
>internet by both MAC address and IP address?

Combine -s with -m mac.
