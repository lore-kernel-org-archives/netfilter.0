From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Basic Routing
Date: Sun, 02 Nov 2008 17:52:59 -0800
Message-ID: <490E597B.50400@amfes.com>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490E12DF.6090602@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Grant Taylor wrote:
> Note:  Because of the length of my reply I'm going to split this reply 
> in to two parts.  The first (previous) part will be on routing in 
> general and the second (this) part will be on NATing.
>
> On 11/2/2008 12:43 PM, Daniel L. Miller wrote:
>> I guess part of my difficulty lies in a lack of experience 
>> configuring non-linux routers.  Behind-the-scenes, as it were, do 
>> all/most routers use NAT to accomplish the goal of linking networks?  
>> It always seemed to me NAT was a 'kludge' that was somehow 
>> unnecessary when "more expensive?" equipment was involved.
>
> No, routers in general do *NOT* use NAT.
>
> In all the above scenarios, all systems in the path see the real 
> source and destination IPs of host 1 and host 2.  NAT is a way to 
> change source and or destination address for some reason.
>
> To understand NATing you need to understand that there are some IP 
> address ranges that are *NOT* suppose to be seen on the global 
> internet and thus have to be changed (translated) in to something that 
> is more acceptable on the global internet.  Similar is also done with 
> in complex networks, especially when tyeing multiple businesses 
> together for some reason.
>
> Usually the reason is that most networks use RFC 1918 Addresses 
> reserved for Private Internets, which are *NOT* suppose to be on the 
> open globally routable internet.  In fact, RFC 1918 addresses are 
> typically filtered out as soon as they hit the internet, or at least 
> the ISP /should/ filter them and not pass them.
I'm going to read these two mails a few times - I sincerely appreciate 
the thorough answer - hopefully it'll penetrate my skull soon enough.

I do understand that the private address ranges were not to be directly 
exposed to the Internet.  I guess what I was looking for was for a 
router to perform the following:

1.  Host 'A' realizes Host 'B' is not on its network
2.  Host 'A' contacts Router 'C' and asks it to get the information out 
and bring back the response.
3.  Router 'C', via whatever magical method (DNS/hosts/etc.) figures out 
the router responsible for Host 'B's presence on the Internet.
4.  Router 'C' contacts Router 'D', sends along the information, and 
tells Router 'D' to send any responses to ROUTER C, not Host A
5.  D, goes to B, comes back to D, and back to C
6.  Router C, on receiving a response from D, remembers that Host 'A' 
was waiting for this information and sends it on.

In essence, I believe I'm correct in this summary - however the tool 
used by Router C for "remembering" that Host A asked for the 
information, and that responses from Router D should come back to Router 
C, is NAT?

So does this mean that ANY connection of a private address space to the 
Internet MUST be performed via NAT?
-- 
Daniel
