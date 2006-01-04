From: "Pedro Drimel Neto" <pedrodrimel@uol.com.br>
Subject: error while compiling 2.6 with POM
Date: Wed, 4 Jan 2006 17:47:29 -0200
Message-ID: <027a01c61167$b27a6ff0$2f00a8c0@TRINTASETE>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

I'm trying to compile kernel with support to POM and when I execute make all 
in kernel, the compilation stop with this error

scripts/Makefile.build:48: kbuild: net/ipv4/netfilter/Makefile - Usage of 
export-objs is obsolete in 2.6. Please fix!
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
net/built-in.o(__ksymtab+0xda8): undefined reference to `udp_v4_lookup'
make: *** [.tmp_vmlinux1] Error 1

Someone has idea about this error?

Regards.


