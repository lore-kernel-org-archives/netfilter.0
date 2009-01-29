From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Re: SMP load balancing of softirqs
Date: Thu, 29 Jan 2009 21:26:48 +0100
Message-ID: <49821108.4090900@redpill-linpro.com>
References: <49817DD4.1010402@redpill-linpro.com>	 <1233226181.13705.24.camel@enterprise.ims-firmen.de>	 <498191AD.7010302@redpill-linpro.com> <1233230764.8230.8.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1233230764.8230.8.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

* Thomas Jacob

> Don't know about the current state of general Linux driver support for
> this, but the Intel hardware also supports multiple RX queues:
> 
> http://www.intel.com/network/connectivity/resources/technologies/10_gigabit_ethernet.htm

This (MSI-X and/or Receive-Side Scaling) looks like exactly the kind of
functionality I need.  Thank you very much for the pointer!  I'll make
sure to let you know how it goes if I get one of these cards in my lab.

Best regards,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
Tel: +47 21 54 41 27
