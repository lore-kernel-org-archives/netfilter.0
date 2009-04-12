From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: question about table filter, nat and mangle with chain default
 policy
Date: Sun, 12 Apr 2009 23:40:38 +1200
Message-ID: <49E1D336.1010303@treenet.co.nz>
References: <965661.5152.qm@web46111.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <965661.5152.qm@web46111.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: my mail <amfpg@yahoo.com>
Cc: netfilter@vger.kernel.org

my mail wrote:
> 
> --- On Sun, 4/12/09, Mart Frauenlob <mart.frauenlob@chello.at> wrote:
> 
> From: Mart Frauenlob <mart.frauenlob@chello.at>
> Subject: Re: question about table filter, nat and mangle with chain default policy
> To: netfilter@vger.kernel.org
> Date: Sunday, April 12, 2009, 7:11 AM
> 
>>    
>> Don't set the policy to DROP in mangle and nat table.
>> Put the drop policy only in filter table.
> 
>> greets
> 
>> Mart
> 
> thanks for your help, but why i can't set policy DROPT in mangle and nat table?
> is the mangle and nat table share chain with filter table or why?
> 
> because as i remember process from INPUT will not pass the rule for OUTPUT and FORWARD
> 
> it's right or i have wrong from understand the iptables rule?
> 
> thx again...
> 

The packet flows diagram can explain a lot more than any amount of text:
  http://l7-filter.sourceforge.net/PacketFlow.png

... now imagine that the boxes labled mangle::PREROUTING  and 
nat::PREROUTING had a DROP for all packets.

Which is configured like this:
  $IPT -t mangle --policy PREROUTING DROP
  $IPT -t nat --policy PREROUTING DROP


AYJ
