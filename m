From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: SNAT and IPSEC
Date: Fri, 15 Jul 2005 14:36:10 -0500
Message-ID: <20050715193610.GA24658@pog.tecnopolis.ca>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
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
To: Eduardo Spremolla <edspremolla@antel.com.uy>, netfilter@lists.netfilter.org

NAT works great over IPSEC with the patches mentioned in previous replies.  
However, the patches only apply (AFAIK) to 2.6.10 or below.  See my 
RH bugzilla entry and make some noise:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

I've been using NAT over IPSEC with those patches with 2.6.10 for ages now
and it works great, mostly.

I sure wish a solution would be found to get this functionality in the 
mainstream netfilter/kernel code!

Everyone who needs this should CC themselves to that bugzilla so we can 
get enough voices behind the effort.

