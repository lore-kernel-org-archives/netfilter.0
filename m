From: <mlody@elpec.com>
Subject: Re: iptables pom installation, help!
Date: Fri, 2 Jul 2004 12:04:19 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3801.80.51.249.26.1088762659.squirrel@www.elpec.com>
References: <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: ryan_pagquil@axisglobal.com
Cc: netfilter@lists.netfilter.org

> hello,
> 	i just want to ask the proper way to install the patch-o-matic for 
> iptables. because i need the libipt_ipv4options.so for my firewall rules. 
> i'm using iptables-1.2.7a. what are the things do i need for me to 
install 
> it properly?
> 
> please help.=(
> 
> thanks in advance,
> Ryan Pagquil
> Jr. Network Engineer
> Axis Global Technologies, Inc.
> Tel. 723-3340 loc. 175
> ryan_pagquil@axisglobal.com
> 
> 
> 

in the p-o-m directory do as follows:
  read INSTALL first and then type:

  export KERNEL_DIR=path to your kernel source
  ./runme extra

instal proper patch and recompile your kernel

Robert


