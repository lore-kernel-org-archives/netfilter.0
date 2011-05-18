From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables-save does not save correcly rateest bps parameter
Date: Wed, 18 May 2011 23:10:11 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105182306010.8472@frira.zrqbmnf.qr>
References: <1303324348.26585.5.camel@uqbar.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1303324348.26585.5.camel@uqbar.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-04-20 20:32, Emilio Lazo Zaia wrote:

>I have found something that may be a bug in iptables-save or in kernel
>'rateest' code.

Oh yeah I stumbled across this too while trying to add the new option 
parser. I will take care of it..


>so it seems to be right, but this line in iptables-save is:
>
>-A Balance -m conntrack --ctstate NEW -m rateest --rateest1 wan1meter
>--rateest-bps --rateest-gt --rateest2 wan2meter -j CONNMARK --set-xmark
>0x1/0xffffffff
