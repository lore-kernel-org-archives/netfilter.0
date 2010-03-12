From: John Haxby <john.haxby@oracle.com>
Subject: Re: drop dhcp request from a particular mac address, after a dhcp
 relay
Date: Fri, 12 Mar 2010 09:06:42 +0000
Message-ID: <4B9A0422.7050007@oracle.com>
References: <937499.80494.qm@web31506.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <937499.80494.qm@web31506.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ming-Ching Tiew <mctiew@yahoo.com>
Cc: netfilter@vger.kernel.org, Robert Nichols <rnicholsNOSPAM@comcast.net>

On 12/03/10 02:27, Ming-Ching Tiew wrote:
> --- On Wed, 3/10/10, Robert Nichols<rnicholsNOSPAM@comcast.net>  wrote:
>
>    
>> Wouldn't it be a lot easier to adjust the DHCP server's
>> configuration by
>> adding a "deny" statement in the pool's permit list?
>>
>>      
> True but manually editing the configuration file will require the dhcp server to be restarted, whereas 'iptables' and/or 'ebtables' can be scripted at runtime.
>    

I'm curious.  Is that actually a problem?  In other words, what breaks 
when you restart the dhcp server?

jch
