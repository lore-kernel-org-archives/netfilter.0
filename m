From: "Allan de Borde" <Allan@southport-college.ac.uk>
Subject: Load Balancing
Date: Wed, 02 Apr 2003 12:16:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se8ad4d0.010@hera>
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
To: netfilter@lists.netfilter.org

I am trying to test the load balancing on a test machine with 2 external =
2Mb Internet links and it doesn't appear to be working. I am using RedHat =
8.0 and get this message when doing ip route list:

default equalize
        nexthop via xxx.xxx.xxx.xxx  dev eth1 weight 1 dead onlink =
pervasive
        nexthop via xxx.xxx.xxx.xxx  dev eth0 weight 1 onlink

I have read a similar problem from this list and it appears that the =
RedHat RPM of iproute2 (iproute-2.4.7-5) is broken and this was resolved =
by installing a newer version of iproute.

As I am very new to some aspects of Linux could someone inform me of how =
to compile and install iproute as it asks for you to change the KERNEL_INCL=
UDE directory in the Makefile and I have no idea where the Kernel include =
directory is. I can't get it to make.

I have downloaded and installed iproute-2.4.7-7.rpm but this also has the =
same problems.

Cheers
Allan



                                        


