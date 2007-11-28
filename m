From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Preventing simple DoS attacks with ipt_recent on Kernel 2.6.9-42.ELsmp
Date: Wed, 28 Nov 2007 10:33:07 -0600
Message-ID: <474D9843.9040605@riverviewtech.net>
References: <CC12CD48AEDA1E4B8A3F626DA84E927209CD45BA@ka-cap-sr-3601.xb.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CC12CD48AEDA1E4B8A3F626DA84E927209CD45BA@ka-cap-sr-3601.xb.local>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/28/07 10:14, Shaun Mccullagh wrote:
> iptables -A FORWARD -p tcp --dport 80 -i eth0 -m state --state NEW -m
> recent --set --name browserconn -j ACCEPT
> 
> iptables -A FORWARD -p tcp --dport 80 -i eth0 -m state --state NEW -m
> recent --rttl --update --seconds 60 --hitcount 100 --name blocked -j
> DROP

...

> Nothing appears in /proc/net/ipt_recent/blocked

...

> What am I doing wrong?

I think the problem you are seeing has to do with the difference of 
"--set" verses "--update" in the recent match.  Namely I'm not sure that 
  "--update" or "--rcheck" will actually add address to a recent list if 
they are not already in there.

> Is the nc test valid?

I'm guessing so seeing as how you are seeing packets added to the 
browserconn recent list.



Grant. . . .
