From: Roberto Nibali <ratz@tac.ch>
Subject: Re: iptables logging exhibites lines on current virtual console
Date: Mon, 09 Dec 2002 12:25:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF47D91.1030209@tac.ch>
References: <1039380153.1095.13.camel@osbourn.intranet>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Luis Fernando C. Talora" <talora-listas@talora.com.br>
Cc: netfilter@lists.netfilter.org

Hello,

> Here's the problem: I've realized that many of the log lines generated
> are exhibited on current console: tty1, tty2, etc. Do anybody know the
> reason of that behavior?

Yes, the problem is that your system seems to be configured with a high 
threshold value for printk in the proc-fs. Check it with:

cat /proc/sys/kernel/printk

The definitions can be found by reading ..linux/kernel/printk.c:

int console_printk[4] = {
         DEFAULT_CONSOLE_LOGLEVEL,       /* console_loglevel */
         DEFAULT_MESSAGE_LOGLEVEL,       /* default_message_loglevel */
         MINIMUM_CONSOLE_LOGLEVEL,       /* minimum_console_loglevel */
         DEFAULT_CONSOLE_LOGLEVEL,       /* default_console_loglevel */
};

An excerpt written by the excellent kernel hacker A. Rubini:
---
The four numbers in /proc/sys/kernel/printk control the ``verbosity'' level of 
the printk kernel function. The first number in the array is console_loglevel: 
kernel messages with priority less than or equal to the specified value will be 
printed to the system console (i.e., the active virtual console, unless you've 
changed it). This parameter doesn't affect the operation of klogd, which 
receives all the messages in any case.
---

 > Is there a way to change that?

echo "1" /proc/sys/kernel/printk

Another problem could arise (depending on the brokeness level of the 
distribution you're using) when starting klogd with a wrong '-c #' value.

Best regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


