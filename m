From: "Raghavan, Srihari" <srihari.raghavan@viasat.com>
Subject: TUN: File descriptor in bad state error
Date: Thu, 7 Nov 2002 11:18:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B370C63B487FD51196760002557CEABA3CD9E6@courier.vmd.viasat.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi all,

    I have the following versions:

    Linux kernel: 2.4.12
    iptables version: 1.2.1a
    
    problem: 

    fd = open("/dev/net/tun", O_RDWR) runs fine and returns a file
descriptor.

    ifr.ifr_flags = IFF_TUN | IFF_NO_PI
    ioctl(fd, TUNSETIFF, (void*) &ifr) runs fine

    but:
    ioctl(fd, TUNSETNOCSUM, 1) fails with "file descriptor in bad state"
    fcntl(fd, F_SETFL, O-NONBLOCK|O_ASYNC) fails with "file descriptor in
bad state"

    Both these calls are done before the ioctl call for TUNSETIFF.

Thanks for your time
Srihari

