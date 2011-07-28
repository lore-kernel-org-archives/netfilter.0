From: "Olshvang, LevX" <levx.olshvang@intel.com>
Subject: RE: Why Port trigger of DD-WRT requires nat table storing trigger ?
Date: Thu, 28 Jul 2011 19:22:00 +0300
Message-ID: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D0699EA@hasmsx502.ger.corp.intel.com>
References: <FE06BAB9E17C4742BB3BE97B2D419D8C2D0D00D5C1@hasmsx502.ger.corp.intel.com>
 <alpine.LNX.2.01.1107271446470.3503@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1107271446470.3503@frira.zrqbmnf.qr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks Jan,

I am not looking for DDWRT experts, I am just applying to the community wisdom to advice me on a question:

What is implication of using a mangle table versus nat table if no nat action (snat, dnat, masquerade) is requested ?


Why nat table is required to execute DNAT or SNAT ?


And finally I had a vey generic question ( and please excuse me  ) -  why we group chains in tables, can we make netfilter without tables ?

To discuss,  (or  clarify my misunderstanding )  the last  question I had posted a separate topic to the list.

Thx,
Lev



-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@medozas.de] 
Sent: Wednesday, July 27, 2011 16:10
To: Olshvang, LevX
Cc: netfilter@vger.kernel.org
Subject: Re: Why Port trigger of DD-WRT requires nat table storing trigger ?

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
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

