From: Jason Opperisano <opie@817west.com>
Subject: Re: I wanna make a new target like SNAT..
Date: Wed, 13 Jul 2005 19:20:42 -0400
Message-ID: <20050713232042.GA25550@bender.817west.com>
References: <9b2a1cff05071315243f973f68@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9b2a1cff05071315243f973f68@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Jul 14, 2005 at 07:24:28AM +0900, JinHyung Park wrote:
> hi..
>  i want to make a new target that works like SNAT, but M:N SNAT..
>  i mean, there are 50 computers and each has a private ip like 192.168.0.x..
>  10 computers need a specific ip of my 50 real ip.
>  so, i want that computers to give given range IPs, and another computers 
> follow anoter iptables rule.
>  for example, i have 1.1.1.1~1.1.1.50 ip, and 1.1.1.1~1.1.1.10 is special 
> IPs..
>  and my 50 computers has a private network, 192.168.0.1~192.168.0.50,
>  some computer that need specific IP assign ( range 1.1.1.1~1.1.1.10 ) and 
> another 40 computers just follow other iptables rule..
>  (like,
> iptables -t nat -A POSTROUTING -d 192.168.0.1-192.168.0.50 -j NEWTARGET --to 
> 1.1.1.1-1.1.1.10
>  and, if all 1.1.1.1-1.1.1.10 are used, other private computer follow 
> another rule.. )
>  i checked ipt_NETMAP.c, just my thought, make a newtarget likes NETMAP with 
> idea like ip pool, but i don know how to pass the next rule if all 
> 1.1.1.1-1.1.1.10 are used. if there is no IP, just return NF_ACCEPT ? ;; 
>  does I make a sense?
>  please help me...

i am surely unclear on what you're trying to do, but if the situation is
that 192.168.0.1 - 192.168.0.10 need to be statically mapped to 1.1.1.1
- 1.1.1.10, and the rest of the network should be mapped to the
remaining pool of public addresses, 1.1.1.11 - 1.1.1.50, you could just
use SNAT rules:

  # one-to-one mappings for .1 - .10
  for i in `seq 1 10`; do
    iptables -t nat -A POSTROUTING -s 192.168.0.${i} \
      -j SNAT --to-source 1.1.1.${i}
  done

  # SNAT pool for remaining IP's
  iptables -t nat -A POSTROUTING \
    -m iprange --src-range 192.168.0.11-192.168.0.254 \
    -j SNAT --to-source 1.1.1.11-1.1.1.50

i'm sure i've missed the point, but who knows--maybe not.

-j

--
"Stewie: Now look here...Jo-LENE. I have an army to raise and I must
 get to Managua at once. I require a window seat and an in-flight Happy
 Meal. BUT NO PICKLES. OH, GOD HELP YOU IF I FIND PICKLES."
        --Family Guy

