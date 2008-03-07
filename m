From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Prioritize packets at user space
Date: Thu, 06 Mar 2008 23:47:45 -0600
Message-ID: <47D0D701.9010605@riverviewtech.net>
References: <7b4d898c0803052100x75f7d47fv53059b19ded04e48@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7b4d898c0803052100x75f7d47fv53059b19ded04e48@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 3/5/2008 11:00 PM, Ling Deng wrote:
> I want to add a priority on the firewall. To prioritize the packets, 
> deep packet inspection is needed, then packets need to be put in 
> different queues depending on the caller and callee numbers.

If you can separate out the calls or mark them somehow, you could use 
Traffic Control to divide things in to different queues for you.  I'd 
suggest looking at SIP Express Router (presuming you are using SIP) as a 
local gateway to route the calls.  If you can get S.E.R. to either mark 
the packets of a call or to send them to different destinations (IP and 
/ or port) you could then use TC to prioritize.  You just have to help 
get the traffic split out (de-multiplexed) so that TC can work with it. 
  Presently TC does not (to my knowledge) have any way to identify what 
calls are what.  However I suppose you could get really creative with 
either the u32 or layer 7 matches and look for specific strings in the 
packet stream and decide what to do with them that way.  If you can get 
IPTables match extensions to differentiate your calls, you can mark them 
so that TC can work with them.

> Thank you very much,

You are welcome, and good luck.



Grant. . . .
