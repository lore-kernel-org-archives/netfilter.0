From: "GoMi" <gomi@perezoso.net>
Subject: Insmod errors
Date: Sat, 7 Feb 2004 10:04:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAQ9p4DPXbskyUcfRAQ4WF9MKAAAAQAAAAl2aSIfQ5yUKq3VxIaUj/RwEAAAAA@perezoso.net>
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

Hi there, every time i try to insmod a module i get these errors:

insmod ipt_mport
Using /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_mport.o
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_mport.o: init_module:
Invalid argument
Hint: insmod errors can be caused by incorrect module parameters,
including invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg

insmod ipt_mport
Using /lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_mport.o
/lib/modules/2.4.20/kernel/net/ipv4/netfilter/ipt_mport.o: init_module:
Invalid argument
Hint: insmod errors can be caused by incorrect module parameters,
including invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg

And so on with many modules. I get no log errors at all, anyone has a
hint on what to do?



