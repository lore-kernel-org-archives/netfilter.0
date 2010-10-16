From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Gcc error trying to use nf_conntrack->id (dereferencing pointer
 to incomplete type)
Date: Sat, 16 Oct 2010 23:17:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010162317020.7076@obet.zrqbmnf.qr>
References: <4CB9FACF.7060407@dcc.ufba.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9FACF.7060407@dcc.ufba.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org


On Saturday 2010-10-16 21:19, Italo Valcy wrote:

>I'm trying to use 'id' field of nf_conntrack struct but I'm getting the
>following error: "dereferencing pointer to incomplete type".
>
>For example, I've tried to modify conntrack-0.9.6 to print this 'id'
>field when "Display a real-time event log":

Unrelated to your issue though, it is usually wise to work with the most
recently released tarball.
