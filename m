From: "Michael Friedhoff" <michael@profindy.com>
Subject: Memory leak?
Date: Tue, 4 Nov 2003 08:49:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c3a2e2$ce7e05e0$12dfa643@tichael>
References: <20031103142830.14782.87331.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031103142830.14782.87331.Mailman@netfilter-sponsored-by.noris.net>
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

Does anyone know of any memory leaks in the
netfilter code?

I have a dedicated dual 667 running as a SNAT server.
It has two Intel Pro100S adapter.  This is a RedHat 9
box.  I am running kernel version 2.4.20-8smp.  I know
it is not as current as what it should be.  This is a
production box and have not had the time to upgrade the
kernel.  I have noticed a steady decrease in the amount
of memory being utilized.

[root@nat root]# ps -A
  PID TTY          TIME CMD
    1 ?        00:00:06 init
    2 ?        00:00:00 migration/0
    3 ?        00:00:00 migration/1
    4 ?        00:00:00 keventd
    5 ?        00:00:00 ksoftirqd_CPU0
    6 ?        00:00:00 ksoftirqd_CPU1
   11 ?        00:00:00 bdflush
    7 ?        00:00:01 kswapd
    8 ?        00:00:00 kscand/DMA
    9 ?        00:00:56 kscand/Normal
   10 ?        00:00:00 kscand/HighMem
   12 ?        00:00:00 kupdated
   13 ?        00:00:00 mdrecoveryd
   21 ?        00:00:05 kjournald
   79 ?        00:00:00 khubd
 1239 ?        00:00:00 kjournald
 1619 ?        00:00:07 syslogd
 1623 ?        00:00:00 klogd
 1641 ?        00:00:00 portmap
 1968 ?        00:00:00 sshd
 2006 ?        00:00:00 gpm
 2053 ?        00:00:00 crond
 2286 ?        00:00:00 atd
 2345 tty2     00:00:00 mingetty
 2346 tty3     00:00:00 mingetty
 2347 tty4     00:00:00 mingetty
 2348 tty5     00:00:00 mingetty
 2352 tty6     00:00:00 mingetty
 4596 tty1     00:00:00 mingetty
 5013 ?        00:02:05 sshd
 5016 pts/0    00:00:00 bash
 5662 pts/0    00:00:00 ps

I am not positive that netfilter is the cause for
the memory loss, but it is the only purpose of the
machine.  In the last 12 hours, the amout of
available memory has decreased by 1.5MB.  I know
that isn't much, but since this is a production box,
I would rather not have to reboot it constantly.

--Michael Friedhoff


