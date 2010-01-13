From: Patrick McHardy <kaber@trash.net>
Subject: Re: Iptables without ipt_state using xt_state
Date: Wed, 13 Jan 2010 09:21:56 +0100
Message-ID: <4B4D82A4.6000102@trash.net>
References: <4B4CB29D.9000506@gmail.com> <4B4CC130.40204@chello.at> <4B4CDEBE.2040304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4CDEBE.2040304@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: FiloSottile <filosottile.wiki@gmail.com>
Cc: netfilter@vger.kernel.org

FiloSottile wrote:
> Mart Frauenlob ha scritto:
>> what does modprobe -v xt_state say?
>>   
> WARNING: Deprecated config file /etc/modprobe.conf, all config files
> belong into /etc/modprobe.d/.
> FATAL: Could not load
> /lib/modules/2.6.18-128.1.1.el5.028stab062.3PAE/modules.dep: No such
> file or directory

> As i said, i am on a OpenVZ VPS, and i cannot modify kernel and modules.

The module needs to be loaded in the initial namespace to
be available in the VPS.
