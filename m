From: Javier Govea <jgovea@magma.ca>
Subject: RE: iptables kernel space
Date: Sun, 20 Jul 2003 20:14:42 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307210014.h6L0Eggh022782@webmail2.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

thank you for your advice but you are talking about the userspace iptables. The kernel
space iptables is in /lib/modules/2.4.20-8/kernel/net/ipv4/netfilter. Buy anyway before i
compile the iptables in kernel space i'm deleting all iptables: the one in
/usr/sbin/iptables and the one in the kernel space...

i'm positive sure that i'm not running two versions...

thank you for you advice....any other ideas?????

thanx
X


On Jul 21, "George Vieira" <georgev@citadelcomputer.com.au> wrote:
> 
> Make sure you don't have 2 versions running. I fell into this trap once with RedHat
where there was a binary in /usr/sbin/iptables and my compiled on it in prefix default of
/usr/local/sbin/iptables.
> 
> check your versions.... just letting you know.
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> <a href='http://www.citadelcomputer.com.au'>http://www.citadelcomputer.com.au</a>
> 
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>  
> 
> -----Original Message-----
> From: Javier Govea [mailto:jgovea@magma.ca]
> Sent: Monday, July 21, 2003 6:29 AM
> To: netfilter@lists.netfilter.org
> Subject: iptables kernel space
> 
> 
> 

