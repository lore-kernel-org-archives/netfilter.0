From: Patrick McHardy <kaber@trash.net>
Subject: Re: why can't I DNAT SIP?
Date: Fri, 09 May 2008 16:23:58 +0200
Message-ID: <48245E7E.8080206@trash.net>
References: <fvtjuu$7i1$1@ger.gmane.org> <48235501.4030608@riverviewtech.net> <fvvuil$ldh$1@ger.gmane.org> <48245C6B.1090506@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48245C6B.1090506@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>, seandarcy2@gmail.com

Grant Taylor wrote:
> On 05/08/08 17:24, sean darcy wrote:
>> I tried it both ways. FWIW, it works both ways for iax. I showed it 
>> that way because the LOG statement were that way. I've run them all 
>> both ways.
>>
>> Yeah, but why is iptables not filtering the packet correctly; it's 
>> just a port 5060 udp packet. How can it matter that it's 5060 instead 
>> of 4569?
> 
> With out knowing the full scenario, I can't say for sure.  Are you 
> dealing with an on going established connection, thus one that is not 
> passing through the NAT chain again?
> 
> Is it possible that you are dealing with SIP Reinvited traffic that 
> really has a source of elsewhere?
> 
> More things are starting to come in to play.

Some questions that might help answering this:

- Which kernel version are you running?

- What helpers are loaded (both NAT and conntrack)

- How does the entry from /proc/net/nf_conntrack for the
   SIP connection look like?
