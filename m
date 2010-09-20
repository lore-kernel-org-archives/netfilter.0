From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Mon, 20 Sep 2010 14:40:06 -0700
Message-ID: <4C97D4B6.2000609@amfes.com>
References: <490DD23F.7060406@amfes.com> <49119087.5060307@thehaxbys.co.uk> <4911D85E.2080109@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4911D85E.2080109@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

  On 11/5/2008 9:31 AM, Grant Taylor wrote:
> On 11/05/08 06:24, John Haxby wrote:
>> Perhaps the problem is that the good people on this list know just 
>> too much about the finer points of routing and the caveats and 
>> wrinkles that you occasionally need to avoid special purpose problems.
>
> *nod* (guilty) *nod*
>
>> Does that help or has it left you even more confused?
>
> I'm guessing that it left Daniel with more to think about and to 
> formulate more questions.  Which is in and of it self a good thing as 
> that is the normal process of learning.  :)
>
>
Once upon a time I asked this list some routing questions.  I've almost 
got it - I swear I've ALMOST got it.  One more little push and I think 
I'm there.

Given the specific architecture:
Windows Workstation 192.168.5.100, default gateway 192.168.5.1
Linux Gateway/Router/VPN node 192.168.7.2, 192.168.5.1, 192.168.0.90, 
default gateway 192.168.7.1
DSL Modem 192.168.7.1

Linux Server/Router/VPN server/Virtual Server 192.168.0.71, 
192.168.56.1, default gateway 192.168.0.1
Virtual Machine 192.168.56.20, default gateway 192.168.56.1

What is the "easiest" way of "achieving routing" between the Windows 
Workstation and the Virtual Machine?  Is this an instance where NAT 
would make administration simpler instead of "pure" routing?  The 
cumbersome-but-working method I have employed at the moment includes;

add 192.168.56.0/24 via 192.168.0.71 route to Workstation
add 192.168.56.0/24 via 192.168.0.71 route to Linux Gateway
add 192.168.5.0/24 via 192.168.0.90 route to Linux Server

I almost understand the need for the 192.168.5.0/24 entry on the Linux 
Server side - because otherwise the router doesn't know how to reply, 
and the same goes for the 192.168.56.0/24 entry on the Gateway side - 
otherwise the Gateway doesn't know how to reach that subnet in the first 
place.  But, if the Gateway is defined as the default for the 
Workstation, why is a routing entry required for the Workstation?
-- 
Daniel
