From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 25 Mar 2010 19:31:40 +0100
Message-ID: <20100325193140.1593fd51@catlap>
References: <067c83163988908ef546d7ff7f560a17@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <067c83163988908ef546d7ff7f560a17@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

> Hello folks,

Hi,

>I observe unused bandwidth on my QoS policy that I cannot explain.
>Conditions are: I have a HTB tree with 8 classes and a total rate of
>768kbits. I use the ATM option so I assume the real rate to be
>something close to 675kbits (about 88% of the ethernet rate).

Try adding p/bfifo or sfq qdisc under the classes. See if it chances
things. Don't ask me why. It just solved some problems in my case. W/o
qdisc I could sometimes see stalls like yours.

Best regards,
Marek
