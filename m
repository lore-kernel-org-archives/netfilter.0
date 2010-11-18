From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptables forwarding packets on the same interface
Date: Thu, 18 Nov 2010 21:56:23 +0100
Message-ID: <20101118215623.6cd0bf50@catus>
References: <AANLkTimDgcNAfVZa6tUpQZFMb-jRXbzsiaDSnCZmqTTe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimDgcNAfVZa6tUpQZFMb-jRXbzsiaDSnCZmqTTe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Scott <djscott@MIT.EDU>
Cc: netfilter@vger.kernel.org

>Hi,

Hi,

>Am I doing this correctly? Can I 'route' packets back on to the same
>interface, out via a different gateway.

You should be able to do that. You are probably filtering some of the
traffic.

> If so, can anyone tell me
>which iptables/routing rule(s) I need to add to forward between
>different network IPs on the same physical interface.

Please send output of iptables-save and ip ro sh from both routers.

Best regards,
Marek
