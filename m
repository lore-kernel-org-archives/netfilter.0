From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: load balancing over a very large number of outgoing addresses?
Date: Tue, 31 Jul 2007 10:01:32 -0500
Message-ID: <46AF4ECC.20305@riverviewtech.net>
References: <46A94A1F.4000107@cs.ucsd.edu>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46A94A1F.4000107@cs.ucsd.edu>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 07/26/07 20:27, Chris Kanich wrote:
> I have recently developed a need to multiplex connections from within a 
> NAT over several (hundred, even thousand if possible) external IPs. I 
> can have all of these IPs routed to a single interface on my NAT box, 
> however I am not exactly sure how to set up a random/round robin load 
> balancing scheme such that outgoing connections from my network each get 
> a random source address from my source address pool.

If I understand what you are wanting to do correctly, that is many to 
many NAT, why not use a range of IP addresses on your SNAT rule?  I.e.:

iptables -t nat -A POSTROUTING -j SNAT --to-source A.B.0.1-A.B.7.255

Would SNAT to an IP in the range of A.B.0.1 through A.B.7.255, thus a 
little over 2000 IPs.

One thing I'm not sure of is how the kernel decides which IP in the 
range to assign, though I bet someone on this mailing list can help 
better answer this.

> However it seems that I cannot scale these routing rules past 255 
> routes, and unlike the example, I am not multiplexing interfaces but 
> only IPs in roughly a contiguous /16 range being routed to this linux 
> machine.

*nod*  I don't think this is what you are wanting to do.

> Any suggestions on how to get this up and running would be greatly 
> appreciated.

See if what I presented above is any where close to what you are wanting 
to do.



Grant. . . .

