From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Ranges and Single IPs
Date: Wed, 9 Apr 2008 22:27:20 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804092226520.17930@fbirervta.pbzchgretzou.qr>
References: <d95317090804091138t3f12f5feo51d16968715ede7b@mail.gmail.com>  <d95317090804091140l3643357fj79ffe44128202ef6@mail.gmail.com>  <alpine.LNX.1.10.0804092113260.17930@fbirervta.pbzchgretzou.qr>
 <d95317090804091217y339b9361vad400ef810c1157b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090804091217y339b9361vad400ef810c1157b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilad Benjamini <gilad.benjamini@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-04-09 21:17, Gilad Benjamini wrote:

>True, but I am looking for a more optimized solution


I assume ipset's iptree is smart enough to do short-circuiting
if you have /24, /16 or /8 networks.
