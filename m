From: <netfilter@drbroyles.com>
Subject: Am I making a bone-headed mistake with patch-o-matic ?
Date: Sat, 23 Nov 2002 11:34:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <031e01c2930e$41097800$4545450a@drbroyles.com>
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

Hello.  I am interested in installing the time extension to iptables but I
am unable to run the following command ...

    iptables -m time

I get the resulting output ...

    iptables v1.2.7a: Couldn't load match
`time':/usr/local/lib/iptables/libipt_time.so: cannot open object file: No
such file or directory

I obviously don't have that file.  I've tried running patch-o-matic like so
...

    KERNEL_DIR=/usr/src/linux-2.4.19 | ./runme base  (this is run from
within the patch-o-matic directory)

Everything looks like it works fine, so I go to my kernel source directory
and run a 'make menuconfig' but I don't see any new options for any of the
extension patches that should be installed now.  Am I making a bone-headed
mistake and just completely missing something?  I am running RedHat 7.2 and
obviously trying to setup kernel 2.4.19.  I got the latest patch-o-matic via
cvs and I installed iptables 1.2.7a from a tar.bz2 file from netfilter.org.

Thanks in advance for any help,
Brandon Broyles


