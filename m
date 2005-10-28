From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 11:33:14 -0500
Message-ID: <200510281133.14216.rob0@gmx.co.uk>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
	<50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
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
To: netfilter@lists.netfilter.org

On Friday 2005-October-28 04:02, Rob Sterenborg wrote:
> I also find it strange that you do have a .so, but not a .ko file.

The .so is iptables(8)'s library (SO="shared object). The .ko is a 
kernel 2.6.x kernel module. Never having compiled iptables myself, I 
don't know for certain, but it seems that the iptables libraries are 
independent of the netfilter drivers. One could probably compile a 
fully-functional[1] iptables on a system with CONFIG_NETFILTER=n ... 
the only requirement being access to appropriate kernel sources.


[1] Fully-functional only under a kernel with CONFIG_NETFILTER=y, of 
course.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

