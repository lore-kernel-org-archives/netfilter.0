From: Ilguiz Latypov <ilatypov@infradead.org>
Subject: Re: pptp+masq fsckup! PLEASE help...
Date: Mon, 6 Jan 2003 14:51:35 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301061446250.6675-100000@localhost.localdomain>
References: <200301061926.49827.roy@karlsbakk.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301061926.49827.roy@karlsbakk.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>


Roy,

I believe you may need to update the iptables package or download it from
netfilter.org's CVS repository.  The older iptables (before 1.2.7a) may
not communicate properly with the new NAT code in the 2.4.20 kernel.

Depending on the networking scenario, you may need to update the kernel
netfilter and PPTP kernel modules and/or the poptop PPTP server.  See

http://lists.netfilter.org/pipermail/netfilter-devel/2002-December/009913.html

http://sourceforge.net/tracker/index.php?func=detail&aid=648880&group_id=44827&atid=441003
http://sourceforge.net/tracker/index.php?func=detail&aid=654010&group_id=44827&atid=441005


Best regards,
Ilguiz

On Mon, 6 Jan 2003, Roy Sigurd Karlsbakk wrote:

> getting the same ole crap as the only time I've ever managed to
> patch-o-maticize the kernel.

> As I try to add the following rule, I just get an 'invalid argument'
> message. The following shows an strace of iptables.


