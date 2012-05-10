From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ipset 6.12 released
Date: Thu, 10 May 2012 12:39:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1205101238020.20012@frira.vanv.qr>
References: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1205101211080.18562@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


On Thursday 2012-05-10 12:18, Jozsef Kadlecsik wrote:

>I'm happy to announce ipset 6.12. This release contains a few important 
>bugfixes, dynamic module support in the ipset tool by Neutron Soutmun
>and several backports and compatibility fixes.

There is no configure script in the current 6.12 tarball,
i.e. autogen has not been run before packing up.
