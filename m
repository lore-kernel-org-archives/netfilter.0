From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: NetBIOS dgm NAT Helper
Date: Sat, 17 Sep 2005 12:21:20 -0400
Message-ID: <1126974080.3098.6.camel@localhost>
References: <1126895937.6687.3.camel@localhost>
	<2b8e1997050916175339d88351@mail.gmail.com>
	<1126923668.6687.25.camel@localhost>
	<2b8e199705091705018859db1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2b8e199705091705018859db1@mail.gmail.com>
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
To: rgarrido.l@gmail.com
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sat, 2005-09-17 at 14:01 +0200, Rafa Garrido wrote:
> On 9/17/05, John A. Sullivan III <jsullivan@opensourcedevel.com> wrote:
> > Thank you but I don't think this helps.  It looks like it is for the
> > name service rather than the datagram service.  I would think such a
> > help would need to rewrite the embedded IP in the NetBIOS header and
> > recalculate any checksumming - John
> 
> Sorry, have you tested this module?
> http://suif.stanford.edu/~csapuntz/ip_nat_netbios.c
> The only thing is that this module don't consider if it is a NetBios
> package or no, assumes that if it comes from udp-port 138 is a NetBios
> package.
> 
<snip>
Thanks.  That looks like what we need.  What is its status within
netfilter? Is it being considered for inclusion? Is it available with
netfilter's blessing and support or is it just something that someone
put together for their own needs but is unmaintained and unsupported?
Thanks again - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


