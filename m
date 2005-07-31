From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall Configuration Question...  Is this possible?
Date: Sun, 31 Jul 2005 13:54:50 -0500
Message-ID: <42ED1E7A.4030301@gmx.co.uk>
References: <1122684637.8190bfctim@linux.a-f.k12.mi.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1122684637.8190bfctim@linux.a-f.k12.mi.us>
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
To: netfilter <netfilter@lists.netfilter.org>

Timothy Patterson wrote:
> I currently have NAT set using masquerading to allow internet access
> from all of our internal computers on the network.  My problem is 
> that I am also trying to run Apache on the box that is doing the NAT
> translation rules.  Is it possible to run a web server on the same 
> box that is performing the translations?

Of course.

> If so, could someone give me a quick example on how to accomplish

Restrict SNAT by interface. Only do it for clients on the LAN.

> this?  I've tried googling for this, but I have not found any 
> pertinent results.

The NAT HOWTO?
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

