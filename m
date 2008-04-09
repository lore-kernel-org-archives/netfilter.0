From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: RE: Iptables Rules
Date: Wed, 9 Apr 2008 11:53:56 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804091153100.4411@fbirervta.pbzchgretzou.qr>
References: <47fc8b35.0e1f400a.4de1.0570@mx.google.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47fc8b35.0e1f400a.4de1.0570@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ukeme Noah <ukeme.noah@gmail.com>
Cc: 'Minh Cao' <minhcao123@yahoo.com>, netfilter@vger.kernel.org


>On Wednesday 2008-04-09 00:01, Minh Cao wrote:
>>Hi, 
>>Is that matter if I placed the options/extensions ( -m
>>and -p ) in different orders ? 
>
>No, but it matters between multiple -m.

On Wednesday 2008-04-09 11:23, Ukeme Noah wrote:
>Howdy,
>The last two, the ones using the state machine might give you problems if
>you use only those without specifying to allow established ssh connections.
>
>So, I'd suggest you add ,ESTABLISHED right after NEW to make the line

Adding random states to rules of which you do not have the context
is unlikely to be fruitful.

