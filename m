From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: ipset & iptables
Date: Wed, 01 Feb 2012 20:31:36 +0100
Message-ID: <1328124696.2644.0.camel@kushiel.sterenborg.info>
References: <1328113968.13053.18.camel@ns014530.dcyb.net>
	 <alpine.DEB.2.00.1202011948160.24072@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1202011948160.24072@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 2012-02-01 at 19:52 +0100, Jozsef Kadlecsik wrote:

> You haven't got the "set" match kernel module, I guess
> 
> grep CONFIG_NETFILTER_XT_SET /boot/config-2.6.39.1
> 
> returns
> 
> # CONFIG_NETFILTER_XT_SET is not set

Grr.. :-/
Thanks for the reminder!


--
Rob


