From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Re: Altering a packet's port
Date: Mon, 21 Mar 2005 20:27:07 -0500
Message-ID: <002201c52e7e$4fe76950$6500a8c0@DEFIANT>
References: <00c501c52e56$acbe6070$bf07a8c0@civicXp> <opsn0cqeu476nf2y@xonix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Netfilter list <netfilter@lists.netfilter.org>

I saw that in the man page, but I need to do this for ALL hosts to specific 
subnets, and many hosts. So I'll have to define one rule for EACH host I 
need a redirect (something like 50 to 75) ?

Nicolas

----- Original Message ----- 
From: "Sertys" <sertys@supportivo.org>
To: "Netfilter list" <netfilter@lists.netfilter.org>
Sent: Monday, March 21, 2005 5:00 PM
Subject: Re: Altering a packet's port


On Mon, 21 Mar 2005 15:43:44 -0500, Nicolas Ross
<rossnick-lists@cybercat.ca> wrote:

> What I want to do, is that if a packet originites from the local net 
> (192.168.7.x) on tcp port 22, that the final destination of the packet 
> would wtill be the same host, but on port 8022...
> (...)

Redirect works on local hooks. Just DNAT it, dude.
iptables -t nat -A PREROUTING -p tcp -s 192.168.x.x --dport 22 -j DNAT
--to-destination f.g.h.i:8022

It's crucial to define dport, not sport, cause your sport is not 22, it's
a client port > 1024 and random.



