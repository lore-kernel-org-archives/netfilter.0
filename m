From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Why Port trigger of DD-WRT requires nat table storing trigger
 ?
Date: Wed, 27 Jul 2011 15:10:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107271446470.3503@frira.zrqbmnf.qr>
References: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D00D5C1@hasmsx502.ger.corp.intel.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D00D5C1@hasmsx502.ger.corp.intel.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Olshvang, LevX" <levx.olshvang@intel.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2011-07-27 09:44, Olshvang, LevX wrote:

>Hi all, 
>
>I am porting DD-WRT port trigger implementation taken from DDWRT 
>project. The logic of port trigger says : wait for somebody from LAN 
>(br0 interface) to send tcp packed to port 6889 to Internet peer. Then 
>Internet peer replies by sending packet to related port 9881 and 
>firewall makes dnat translation.

DDWRT's xtables stack has been left behind 3 years ago and then 
agglomerated with weird extra components with questionable uses, 
including, but not limited to, ipt_TRIGGER, which is not even 
documented to begin with, so chances for any explanations are quite 
dim.

>The last command inserts rule into nat table, and the trigger 
>implementation code gives an error if a mangle table is used instead. 
>The question is why ?
