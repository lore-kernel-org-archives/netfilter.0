From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Iptables without ipt_state using xt_state
Date: Tue, 12 Jan 2010 19:36:32 +0100
Message-ID: <4B4CC130.40204@chello.at>
References: <4B4CB29D.9000506@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4CB29D.9000506@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: FiloSottile <filosottile.wiki@gmail.com>

On 12.01.2010 18:34, FiloSottile wrote:
> I am running on a OpenVZ box with static unmodifiable kernel.
> I have no ipt_state and ipt_connmark but i have xt_state and xt_connmark.
> I want to build a simple firewall, but when i run that:
> 
> # iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables: No chain/target/match by that name
> 
> How to use xt_state instead ipt_state? Or there is an alternative way to
> build firewall?
> Thank you
> 

eris:~# modinfo xt_state
filename:
/lib/modules/2.6.24-etchnhalf.1-686/kernel/net/netfilter/xt_state.ko
license:        GPL
author:         Rusty Russell <rusty@rustcorp.com.au>
description:    ip[6]_tables connection tracking state match module
alias:          ipt_state
alias:          ip6t_state
vermagic:       2.6.24-etchnhalf.1-686 SMP mod_unload 686
depends:        x_tables,nf_conntrack

eris:~# grep -w xt_state /lib/modules/$(uname -r)/modules.alias
alias ipt_state xt_state
alias ip6t_state xt_state


xt_state is the successor of ipt_state.

what does modprobe -v xt_state say?
uname -a?


regards

Mart


