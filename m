From: "Allan de Borde" <Allan@southport-college.ac.uk>
Subject: Re: Load Balancing
Date: Thu, 03 Apr 2003 08:40:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se8bf384.070@hera>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: mgm@paktronix.com
Cc: netfilter@lists.netfilter.org

Thanks,

I didn't have the Kernel Development installed so installed it and then I =
could compile the latest iproute.
With this version of iproute the ip route list command has lost the dead =
onlink pervasive message
and it all looks ok. I will have to test further but it's looking good.

Cheers,
Allan=20

>>> "Matthew G. Marsh" <mgm@paktronix.com> 04/02/03 05:43pm >>>
On Wed, 2 Apr 2003, Allan de Borde wrote:

> I am trying to test the load balancing on a test machine with 2 external
> 2Mb Internet links and it doesn't appear to be working. I am using
> RedHat 8.0 and get this message when doing ip route list:
>
> default equalize
>         nexthop via xxx.xxx.xxx.xxx  dev eth1 weight 1 dead onlink =
pervasive
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

KERNEL_INCLUDE=3D/usr/src/linux

Even RH symlinks /usr/src/linux to the appropriate version of kernel
installed. Make sure that you have installed the kernel development RPM as
that has the actual include files. Not installed by default unless you
installed the Developer workstation.

> I have downloaded and installed iproute-2.4.7-7.rpm but this also has =
the same problems.
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
Email: mgm@paktronix.com=20
WWW:  http://www.paktronix.com=20
--------------------------------------------------




                                        


