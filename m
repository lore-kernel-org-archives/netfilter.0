From: bt spawn <thejiggse@yahoo.com>
Subject: Compiling iptables 1.2.8 make error
Date: Mon, 30 Jun 2003 12:50:43 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630195043.56362.qmail@web13205.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hello All:

Any help on this issue would be greatly appreciated. 
I have installed the 2.4.19-11 kernel and iptables
1.2.8 on four systems with no errors.  On the fifth
machine I decided to install patch-o-matic before
installing iptables 1.2.8.  I have no idea if that
caused the problem I am having, but when I try to
compile iptables for this particular system I get the
error listed below:

cc -O2 -Wall -Wunused -I/usr/src/linux/include
-Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o
extensions/libipt_condition_sh.o -c
extensions/libipt_condition.c
extensions/libipt_condition.c: In function `parse':
extensions/libipt_condition.c:49: `CONDITION_NAME_LEN'
undeclared (first use in this function)
extensions/libipt_condition.c:49: (Each undeclared
identifier is reported only once
extensions/libipt_condition.c:49: for each function it
appears in.)
make: *** [extensions/libipt_condition_sh.o] Error 1


Any ideas?

Best Regards,

James 


__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

