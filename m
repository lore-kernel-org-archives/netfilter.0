From: Torsten Puls <lists@pumpum.de>
Subject: Re: Time Patch on 1.2.6a
Date: Sat, 14 Dec 2002 13:55:06 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021214125506.905831B7AEF@webbox10.server-home.net>
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

Hello,

I work with Debian/GNU Linux Woody 3.0
Anyway.

download patch-o-matic.tar.gz from netfilter.org

cd /usr/src
tar -xzvf patch-o-matic.tar.gz

cd patch-o-matic

KERNEL_DIR=/usr/src/linux ./runme pending

or/and

KERNEL_DIR=/usr/src/linux ./runme base

and/or

KERNEL_DIR=/usr/src/linux ./runme extra

so that's it.

Now you can recompile your new Kernel.

Greetz Torsten

