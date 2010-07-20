From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT appears to be unaware of ports in use on router
Date: Tue, 20 Jul 2010 20:13:51 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007202007120.20502@obet.zrqbmnf.qr>
References: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Ditner <sditner@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-07-20 19:00, Simon Ditner wrote:

>I have asterisk running SIP on a router using UDP port 5060 that's
>also handling NAT for a network. I'm often doing testing behind NAT
>with other SIP devices using UDP port 5060 talking to the internet,
>and have run into a problem where NAT is able to claim 5060.

nf_nat does not check for local socket existence AFAICS and uses the 
full 1024:65535 range (when no other options are specified for S/D-NAT) 
for connections that originated with a srcport of 1024:65535.
It cannot easily check for it anyway, due to things like conntrack zones 
or the user willingly wanting to "go around" local sockets.
