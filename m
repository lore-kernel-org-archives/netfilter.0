From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: Load Balancing
Date: Wed, 2 Apr 2003 10:43:09 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0304021041400.24259@netmonster.pakint.net>
References: <se8ad4d0.010@hera>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se8ad4d0.010@hera>
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
To: Allan de Borde <Allan@southport-college.ac.uk>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Apr 2003, Allan de Borde wrote:

> I am trying to test the load balancing on a test machine with 2 external
> 2Mb Internet links and it doesn't appear to be working. I am using
> RedHat 8.0 and get this message when doing ip route list:
>
> default equalize
>         nexthop via xxx.xxx.xxx.xxx  dev eth1 weight 1 dead onlink pervasive
>         nexthop via xxx.xxx.xxx.xxx  dev eth0 weight 1 onlink
>
> I have read a similar problem from this list and it appears that the
> RedHat RPM of iproute2 (iproute-2.4.7-5) is broken and this was resolved
> by installing a newer version of iproute.
>
> As I am very new to some aspects of Linux could someone inform me of how
> to compile and install iproute as it asks for you to change the
> KERNEL_INCLUDE directory in the Makefile and I have no idea where the
> Kernel include directory is. I can't get it to make.

KERNEL_INCLUDE=/usr/src/linux

Even RH symlinks /usr/src/linux to the appropriate version of kernel
installed. Make sure that you have installed the kernel development RPM as
that has the actual include files. Not installed by default unless you
installed the Developer workstation.

> I have downloaded and installed iproute-2.4.7-7.rpm but this also has the same problems.
>
> Cheers
> Allan
>
>
>
>
>
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 553-2288
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------

