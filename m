From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: CLUSTERIP: no conntrack error
Date: Sun, 25 Jul 2010 18:34:59 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007251834380.14790@obet.zrqbmnf.qr>
References: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinWzfnYgN0vTECKfgYxUPYynPr0OHVfgEbZyRfj@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edison Figueira <efjgrub@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-07-14 00:18, Edison Figueira wrote:

>I configured CLUSTERIP in two boxes to make balancing proxy, and
>apparently it all worked but I get several messages from "CLUSTERIP:
>no conntrack.
>
>Does anyone know what this message means?

Means packets are tagged as INVALID.
