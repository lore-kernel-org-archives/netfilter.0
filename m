From: Alexis <alexis@attla.net.ar>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 11:51:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077202309.1578.10.camel@pepelui.baicom>
References: <4034c46c.4a64.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4034c46c.4a64.0@arbbs.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: black@arbbs.net
Cc: Netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-02-19 at 11:13, John Black wrote:
> >
> >Okay, so that rule is going to hide your 192.168.0.0/24 >network behind the
> public address of the firewall for all >packets going to addresses in the range
> 161.x.x.x/21 (ie 8 >Class C's in size).
> 8 Class C's?

if 24 bits define a mask that is considered as Class C

24-21 = 3 
2 power 3 = 8 

so, its 8 /24 or 8 Class C networks.



> 
> >How are you testing this and deciding it doesn't work?
> im testing it with my windows machine going to the msn chat rooms, because i
> know i will show you what ip address you are coming from.  is there a better
> way to check it.

www.whatsmyipaddress.com is a lazy but effective way :)

or just simply log or sniff output packets


> >(By the way, why are you only translating packets which are >going to (presumably)
> your ISP?   What about packets going >anywhere else on the Internet?).
> 
> I thought that translated all of the packets?  How is it only translating packets
> to the ISP?
> 

this assumption is because you're saying 161.x.x.x/21  as destination,
all other destinations that doesnt belong to 161.x.x.x to
161.x.x+8.x+255 will be not nat'ed




> john
> http://www.arbbs.net/
-- 
Alexis <alexis@attla.net.ar>


