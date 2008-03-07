From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PPPoE on a bridge, nat sees bridge as incoming interface
Date: Fri, 07 Mar 2008 02:13:55 +0100
Message-ID: <47D096D3.8090208@plouf.fr.eu.org>
References: <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net> <20080307004918.GB31248@possum.gg3.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080307004918.GB31248@possum.gg3.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Georgi Georgiev wrote :
> 
> I thought the bridge was supposed to behave like a switching
> hub. And it probably does, but I had misconfigured it.

Yes it does. Originally, i.e. in the vanilla 2.4 kernel, this is exactly 
and only what it does. Then people thought it would be cool to add some 
filtering capabilities so you could build a filtering bridge. So here 
came ebtables. But it had some limitations, so people thougt it would be 
cool that netfilter/iptables could be used on bridged IP packets, 
although it would be an ugly hack. So here came bridge-nf. Then people 
thought it would be cool that netfilter/iptables could also be used on 
IP packets encapsulated in bridged VLAN tagged frames, and finally in 
bridged PPPoE frames. So far so good. But IMHO the problem is that those 
features should have been disabled by default so the original behaviour 
expected by most people would have been preserved.
