From: Guillowind@aol.com
Subject: libipt_{psd,string}.so patch-o-matic extensions dont compile to executables.
Date: Sun, 22 Aug 2004 17:44:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <19CFBFA3.15AC7451.0B9ABE5A@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello all,

I've having some issues with trying to get the following extension compiled as executables, im using fedora core2 with kernel-2.6.5-1.358

libipt_{psd,string}.so patch-o-matic extensions dont compile to executables.

they do compile as kernel modules, & when i try and recompile iptables i see the extensions found message, but these specific ones dont make executables.

If someone could tell me how to get this going id really apprieciate it, and or if they could tell me the command options to compile the c code by hand id be happy to give that a try. ( i tried gcc -Wall -ggdb libipt_string.c -o libipt_string.so)

Thanks in advance!

