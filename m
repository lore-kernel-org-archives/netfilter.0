From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Help me... please
Date: Sat, 02 Aug 2008 10:10:45 +0200
Message-ID: <48941685.8080509@unipex.it>
References: <K4XRO1$60B3DD52CED09AAF46CAA0DC13BE33CD@libero.it> <38db14850808012326g4e3e35b6yc6f1c8b5adf69120@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850808012326g4e3e35b6yc6f1c8b5adf69120@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Anatoly Muliarski wrote:
> Hi,
> 
> You should remove -m state --state NEW statements because they track 
> only START of connections.
> 


Or you can accept the established and related _before_ to the other rules.

$IPTABLES -I INPUT 1 [FORWARD] -m state --state RELATED,ESTABLISHED -j 
ACCEPT

However, can you send us the log that drop the traffic on the rule_39 ?

Michele
