From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: SNAT round-robin broken?
Date: Mon, 13 Feb 2006 21:45:24 +0100
Message-ID: <200602132145.27983@krak>
References: <3d00e6dc0602100722l482ae14naa0964f58fb83753@mail.gmail.com>
	<200602102212.22491@krak>
	<3d00e6dc0602130610j3ccc1c2cseaf06598999ab0b2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3d00e6dc0602130610j3ccc1c2cseaf06598999ab0b2@mail.gmail.com>
Content-Disposition: inline
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
To: Khoa Nguyen <khoa.coffee@gmail.com>
Cc: netfilter@lists.netfilter.org


  Hi,

On Monday 13 February 2006 15:10, Khoa Nguyen wrote:
> >   Have you tried it with more than one internal IP address connecting
> > to multiple destination addresses? Netfilter chooses the translated
> > source IP based on the source and destination address of the original
> > connection.
>
> Yes, if I tried with more than one internal IP address, the SNAT code
> would map to a different source IP address. This behaviour, however,
> is different from that of kernel 2.4.x ? I used to be able to simulate
> thousands of clients with SNAT and just one internal IP address. Is it
> possible to force the same round-robin behaviour in 2.6.12 kernel?

  Unfortunately not, at least not without modifying the source code :) The 
behaviour of the NAT code changed when Rusty's NAT simplifications were 
merged in 2.6.11. I personally think this new behaviour is better than 
the old one, as it provides increased performance and better cooperation 
with load balancing solutions and other NAT-sensitive equipment.

  Why exactly do you want to achieve the round-robin behaviour for one 
internal IP?

-- 
 KOVACS Krisztian

