From: Ingmar Schuster <ingmar.schuster@first.fraunhofer.de>
Subject: Re: poll() call gives POLLERR, then hangs
Date: Tue, 31 Mar 2009 12:32:57 +0200
Message-ID: <49D1F159.3070805@first.fraunhofer.de>
References: <EE574442-8086-41C7-B537-29681D1EA574@first.fraunhofer.de> <49D1C32F.9020309@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49D1C32F.9020309@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Hey,

solved the problem already. It turned out not to be a bug in netfilter.
First there was a slight error in the way I rewrote the MAC addresses in 
the pcap file. Then tcprewrite had a bug that caused one MAC to be 
rewritten incorrectly. I fixed that with a sed-like tool called bbe.

Yours
Ingmar


Pablo Neira Ayuso schrieb:
> if you can send a very small pet program that can allow me to reproduce
> this error that you're reporting, it would be much easier to diagnose.
>   

