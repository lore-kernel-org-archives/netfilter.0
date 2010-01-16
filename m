From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Iptables without ipt_state using xt_state
Date: Sat, 16 Jan 2010 13:34:43 +0100
Message-ID: <4B51B263.4080301@chello.at>
References: <4B4DC17D.2010200@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4DC17D.2010200@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: FiloSottile <filosottile.wiki@gmail.com>, netfilter@vger.kernel.org

On 13.01.2010 13:50, FiloSottile wrote:
> I cannot verify if the module is loaded from the config, but if it is
> loaded the command
> 
> # iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> should work...
> So, if don't have that module loaded, how can i do to get a firewall
> configured?

Patrick McHardy already pointed it out, but this may help to understand:

http://wiki.openvz.org/Setting_up_an_iptables_firewall

chapter:
'Setting up a firewall that allows per-container configuration '


If you can't do it, it comes down to what /dev/rob0 said:

> I suspect that this comes down to being a support issue with your
> service provider. Did you ask them?

regards

Mart
