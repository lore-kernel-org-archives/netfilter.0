From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to mark traffic on used bandwidth
Date: Mon, 23 Jun 2008 21:28:05 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806232125430.16957@fbirervta.pbzchgretzou.qr>
References: <38db14850806230123h2c0a1aa4uef8afd8275d07d98@mail.gmail.com>  <d39744a20806230335u4c527f53p258437b4bcc8416@mail.gmail.com>  <alpine.LNX.1.10.0806231717480.26570@fbirervta.pbzchgretzou.qr>  <38db14850806231109p4ef2197cu48082c445fea34ce@mail.gmail.com>
  <alpine.LNX.1.10.0806232032100.16957@fbirervta.pbzchgretzou.qr> <38db14850806231212y4326697cwe0ab96c842aa7749@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850806231212y4326697cwe0ab96c842aa7749@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoly Muliarski <x86ever@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-06-23 21:12, Anatoly Muliarski wrote:

>Thanks again :)
>I looked at the sources and understood that it is just the thing!
>A couple of questions. What for are two estimators used and what mean
>their names?
>Why don't use it as -m limit semantics?

-m limit has a ... math problem related to accuracy it seems.

See linux kernel commit 50c164a81f1c0dfad056f99e5685537fdd0f07dd
for a use case. Two rate estimators are only used if you are
going to calculate the delta between them.
