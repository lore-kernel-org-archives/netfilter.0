From: Bill McCormick <wpmccormick@sbcglobal.net>
Subject: Re: one interface, basic setup
Date: Thu, 21 Jul 2005 22:28:27 -0500
Message-ID: <42E067DB.3060809@sbcglobal.net>
References: <42DF0A8E.9020102@sbcglobal.net> <42DF8BDE.5080805@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DF8BDE.5080805@gmx.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

/dev/rob0 wrote:

> Bill McCormick wrote:
>
>> (basic and packet filtering) I still feel unsure. I want to build a 
>> FW for outgoing packets only. My setup looks like this:
>>
>> internet <---->Netgear FVS318 <----> LAN
>
[snip]

> I think I'd set up a different logical segment for the clients, such 
> that they could not reach the router at all. Just one more hurdle for 
> any would-be "extruder" trying to get out.

This a home setup. First and formost, I want to restrict, limit and 
control what clients can send out and to where. Basically, I just want 
ALL out-bound traffic to pass through FC3 iptables then get routed to 
the FVS318.

So, the best (easiest) way to accomplish this is to make the FC3 the 
gateway router by adding another interface? Do the NAT rules get crazy 
for that? Are the routing tables complicated?

Thanks




-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.9.2/53 - Release Date: 7/20/2005


