From: Samuel Richard <Samuel.Richard@USherbrooke.ca>
Subject: Help building shared version of libiptc library (libiptc.so)
Date: Mon, 19 Jul 2004 16:14:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090268046.3172.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

I am trying to use jnetfilter, which requires that I generate a shared
version of libiptc.  Here's what they say:

"In order to get the jnetfilter package to work, you also have to
download the source code of iptables (from www.netfilter.org or
www.iptables.org), and modify the Makefile slightly to generate a shared
version of the libiptc.a library (libiptc.so)."

They also privide us with a modified version of the makefile which looks
like that:

TOPLEVEL_INCLUDED=YES
NETFILTER_VERSION=1.2.1a
CFLAGS=-Wl,-export-dynamic -fPIC -shared -DNETFILTER_VERSION=\"1.2.1a\"

libiptc/libiptc.so : Makefile.libiptc libiptc/libiptc.c
	gcc $(CFLAGS) libiptc/libip4tc.c -o libiptc/libiptc.so

I tried to modify my makefile without any success...  Does anyone know
how to do this?

Thanks,

Sam



 


