From: "lux" <netfilter@iotti.biz>
Subject: RE: compiling iptables on fedora core 4
Date: Sat, 10 Dec 2005 08:49:04 +0100
Message-ID: <NCBBJCDIGFAINBLFEHILOEIHIBAA.netfilter@iotti.biz>
References: <s3981510.038@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s3981510.038@gwia201.syr.edu>
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
To: Randy Grimshaw <rgrimsha@syr.edu>
Cc: netfilter ML <netfilter@lists.netfilter.org>

> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Randy
> Grimshaw

> When I attempt to compile iptables, on fedora core 4, using:
> make KERNEL_DIR=/usr/src/redhat/BUILD/kernel-2.6.11/linux-2.6.11
>
>  it fails with the message:
> /usr/src/redhat/BUILD/kernel-2.6.11/linux-2.6.11/include/linux/con
> fig.h:6:2: error: #error including kernel header in userspace;
> use the glibc headers instead!

Go to http://ep09.pld-linux.org/~mmazur/linux-libc-headers/ , download the
headers for 2.6.11, read the doc, use them. Very important, read the doc or
they won't behave as expected.
Try googling around for this issue, you'll find plenty of discussions on it.


