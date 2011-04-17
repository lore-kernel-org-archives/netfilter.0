From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Latest iptables & latest xtables-addons
Date: Sun, 17 Apr 2011 21:49:41 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104172148170.5730@obet.zrqbmnf.qr>
References: <BANLkTine5QOi2JPVGiJnPAfLPgDK1Fs8gQ@mail.gmail.com> <alpine.DEB.2.00.1104172032350.4911@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1104172032350.4911@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Pandu Poluan <pandu@poluan.info>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sunday 2011-04-17 20:37, Jozsef Kadlecsik wrote:

>On Sun, 17 Apr 2011, Pandu Poluan wrote:
>
>> AFAIK installing the latest xtables-addons also installed ipset 4.5.
>> 
>> So, how do I install the latest xtables-addons yet also install ipset 6.3?
>
>xtables-addons from git contains ipset 6.3.

Before building, edit the mconfig file of Xt-a (>= 1.35) to select 
ipset6 instead of ipset4.
