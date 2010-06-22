From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking Ads.
Date: Tue, 22 Jun 2010 21:14:34 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006222113580.3363@obet.zrqbmnf.qr>
References: <868109.94510.qm@web112409.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <868109.94510.qm@web112409.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ninad A <ninad_adi@yahoo.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-06-22 20:18, Ninad A wrote:

>Hope What I am asking is not idiotic.
>
>When we block ads or any such things with iptables then there is lot of delay caused for the application to complete as it is expecting the data which has already been dropped.
>Packets are dropped at IP Layer but who takes care of the delay caused to the application and how to minimize that delay ?

You have to use REJECT for an immediate reponse/teardown, not DROP.
