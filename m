From: James Stickland <jimmy@sympatico.ca>
Subject: cannot open shared object file: no such file or directory
Date: Tue, 12 Nov 2002 21:27:38 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0211122116250.189-100000@laptop.sympatico.ca>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, i recently ran patch-o-matic to patch my kernel for the string match
from the extra patches.

I ran patch-o-matic, and it copied the string files to
/usr/src/linux/net/ipv4/netfilter.  Ok, so far so good.

I went to compile my kernel, and have ipt_string as a module.  I did so by
adding the line CONFIG_IP_NF_MATCH_STRING=m in my /usr/src/linux/.config.

I proceeded to do the standard make dep ; make modules ; make
modules_install ; make bzImage.  THe kernel compiled, i rebooted, and was
successfully able to modprobe ipt_string.
(/lib/modules/2.4.19/kernel/net/ipv4/netfilter/ipt_string.o)

However, when i went to make use of the ipt_string match in an iptables
rule, i was given the following error:

iptables v1.2.7a: Couldn't load match
`string':/usr/local/lib/iptables/libipt_st
ring.so: cannot open shared object file: No such file or directory

Upon inspection, the libipt_string.so did not exist in
/usr/local/lib/iptables.  How do i get this netfilter library to exist?

I had this problem the last time i patched my kernel to support ipt_psd,
but i cannot recall how i was able to get the psd library to exist.

Did i miss a step while patching this time?  Anyone with help please
respond to the list and my email directly - jamesstickland@sympatico.ca

Thank you.





