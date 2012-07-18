From: Ed W <lists@wildgooses.com>
Subject: Re: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 17:19:53 +0100
Message-ID: <5006E229.3070701@wildgooses.com>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com> <CAJygYd2LoqUKa_r+DomrvrgCDJ1bDXgu=wgvXUpkjnURAE5eJw@mail.gmail.com> <CANaOhebb3bQ1NsqEKjm2+BRsTyVozsE3hLmCa5pQUcqFK_UEhA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANaOhebb3bQ1NsqEKjm2+BRsTyVozsE3hLmCa5pQUcqFK_UEhA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kay <kay.diam@gmail.com>
Cc: netfilter@vger.kernel.org

On 18/07/2012 08:45, kay wrote:
> ipvs works in couple with keepalived. I don't need to balance traffic
> between web1 and web2, I need to pass matched some rule packets (and
> subsequents) to web2 transparently. Established connection should not
> be reset and client should not know about that.
>

For many situations a frontend load balancer is very lightly loaded when 
proxying through to a backend http server.  Perhaps you don't need to do 
this transparently and simply adding a high performance non transparent 
proxy would be a solution?

Good luck

Ed W
