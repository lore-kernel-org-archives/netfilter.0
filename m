From: Mihael Kukec <mkukec@public.srce.hr>
Subject: Re: newbie question : ip_conntrack_ftp
Date: Wed, 24 Mar 2004 14:04:23 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.50.0403241401480.16713-100000@jagor.srce.hr>
References: <Pine.GSO.4.50.0403231611290.14538-100000@jagor.srce.hr>
 <20040324031150.GN3387@samad.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040324031150.GN3387@samad.com.au>
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
To: netfilter@lists.netfilter.org




On Wed, 24 Mar 2004, Alexander Samad wrote:

> On Tue, Mar 23, 2004 at 04:13:52PM +0100, Mihael Kukec wrote:
> > not have ip_conntrack_ftp module included and I need it. Can someone give
> then run
> dpkg -L '<insert the package name from above>' | grep -i conn
> this should show you all the conntrack modules in the packages.
> Some else stated in another thread that the BF2.4 package doesn't come
> with all the conn track modules


Well. tih was the outcome:

sphere:~# dpkg -L kernel-image-2.4.18-686 | grep -i conn
/lib/modules/2.4.18-686/kernel/net/ipv4/netfilter/ip_conntrack.o
/lib/modules/2.4.18-686/kernel/net/ipv4/netfilter/ip_conntrack_irc.o
/lib/modules/2.4.18-686/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
sphere:~# insmod ip_conntrack_ftp
Using /lib/modules/2.4.18-686/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
sphere:~#


Module was all the time here. Sorry for stupid question :)


Mihael



