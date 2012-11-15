From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Iptables rules with module string give strange counter results
Date: Thu, 15 Nov 2012 17:47:51 +0200
Message-ID: <50A50EA7.6090001@ngtech.co.il>
References: <CAAvRK96MCUh4XmeDVd8VU+P5_QvxO6D1_RYHxWBO6MPcOWCRKw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAvRK96MCUh4XmeDVd8VU+P5_QvxO6D1_RYHxWBO6MPcOWCRKw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Budnev <vladimir.budnev@gmail.com>
Cc: netfilter@vger.kernel.org

Is this a router?
The src is the machine or other machine?

Regards,
Eliezer

On 11/15/2012 4:01 PM, Vladimir Budnev wrote:
> Hello al.
>
> This is the first time I'm using matching string module for iptables
> and met some strange behaviour I can't overcome.
>
> In short, it looks like iptables passes "trimmed" packets to module,
> so module can not parse whole packet for string.
> I cant find any information about such behaviour on net. All examples
> and tutors should work like a charm, but they dont.
