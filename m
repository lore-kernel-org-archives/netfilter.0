From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Ranges and Single IPs
Date: Wed, 9 Apr 2008 21:15:41 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com> <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 20:40, Gilad Benjamini wrote:

>I'd like to write a rule for a group. A group can include both single
>IP addresses and ranges of addresses.
>ipset can do the job with single addresses.
>ipragne can do the job with ranges
>
>How can I combine the two ?

A range can be modeled upon collections of single addresses.
In short, you still use ipset; it will convert a range
to a number of single addresses and everything is fine. No?
