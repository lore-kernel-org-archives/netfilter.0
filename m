From: Marcin Szewczyk <marcin.szewczyk@wodny.org>
Subject: Re: re-routing multicast pkts after mangle table marking
Date: Wed, 2 Dec 2020 18:03:41 +0100
Message-ID: <X8fI7ZzRS1zycdeS@flatwhite>
References: <X8aQRtjwMXfstjRr@flatwhite>
 <CAF4tN+_YNz+0iCQzW7Fd+P5ZkDkU5g95Jv5fdHPNcqhzWtOOng@mail.gmail.com>
 <X8bE6GMR6U37cfH/@flatwhite>
 <CAN_K0LS+U95rxmhCtiE3sX_hdjEQySnV1HBB9sF1qrrVAz0n-w@mail.gmail.com>
 <X8d5JZT5cmBFUvNA@flatwhite>
 <001f01d6c8a4$0faac590$2f0050b0$@gmail.com>
 <X8eKYjtPSINtYYnl@flatwhite>
 <002e01d6c8c3$d4fa4e00$7eeeea00$@gmail.com>
 <X8e8+YL653hAkGe9@flatwhite>
 <c6c5895d-145a-3a04-3064-40d42db75be7@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c6c5895d-145a-3a04-3064-40d42db75be7@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fatih USTA <fatihusta86@gmail.com>
Cc: Eliezer Croitor <ngtech1ltd@gmail.com>, 'Netfilter Users Mailing list' <netfilter@vger.kernel.org>

On Wed, Dec 02, 2020 at 07:30:11PM +0300, Fatih USTA wrote:
> I'm not sure, am I understand you correctly?

I sincerely have no idea which part of the thread you are referencing.

> But I created testing topology with namespace for multicast routing and it
> worked.

And it is not a surprise. I have already mentioned at the beginning that
I have experimented with success using namespaces, see:
https://marc.info/?l=netfilter&m=160685018618860
And also mentioned veth:
https://marc.info/?l=netfilter&m=160691271903616
It worked even without smcroute.

> I tested on ubuntu 18.04 but probably works on debian buster too.

This does not answer the main question: why doesn't fwmark work with `ip
rule` for multicast and broadcast traffic, see:
- https://marc.info/?l=netfilter&m=142714167809246
- https://marc.info/?l=netfilter&m=160685018618860

-- 
Marcin Szewczyk
http://wodny.org
