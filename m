From: "prince" <prince@resoftcorp.com>
Subject: How do I boot from different kernel when I don't have access to the console?
Date: Wed, 14 Jan 2004 12:08:51 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040114200851.M90054@resoftcorp.com>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk> <008401c3d9cb$d634aa30$23c051cb@ns3.worldcall.net.pk> <00c201c3d9ce$62968d70$23c051cb@ns3.worldcall.net.pk> <200401130838.47327.Alistair Tonner <> >  <012001c3d9ea$a64d8a20$23c051cb@ns3.worldcall.net.pk> <1074028552.1586.17.camel@alpha.newkirk.us> <00a801c3da5f$891ec7f0$23c051cb@ns3.worldcall.net.pk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a801c3da5f$891ec7f0$23c051cb@ns3.worldcall.net.pk>
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

Recently I downloaded some kernel*.rpm (Linux i386) from 
https://rhn.redhat.com/errata/RHSA-2003-417.html  and I installed all the 
rpms using "rpm -iUvh kernel*.rpm". My mistake. I should have used "rpm -
Fvh". Now I do not know what kernel was there previously. From the following 
output it looks, I had 2.4.20-18.9smp earlier.

% ls -l /lib/modules/
total 12
drwxr-xr-x    3 root     root         4096 Jan  6 15:03 2.4.20-18.9smp
drwxr-xr-x    3 root     root         4096 Jan 12 16:01 2.4.20-28.9
drwxr-xr-x    3 root     root         4096 Jan  6 15:02 2.4.20-28.9BOOT

% rpm -qa | grep kernel
kernel-pcmcia-cs-3.1.31-13
kernel-2.4.20-28.9
kernel-BOOT-2.4.20-28.9
kernel-doc-2.4.20-28.9
kernel-source-2.4.20-28.9

Now, whenever I boot the system it comes up with "2.4.20-28.9BOOT" which 
doesn't have iptables module.

% lsmod
Password:
Module                  Size  Used by    Not tainted
e1000                  54528   1 
ext3                   61280   2 
jbd                    46804   2  [ext3]
3w-xxxx                36192   3 
sd_mod                 11916   6 
scsi_mod               63416   2  [3w-xxxx sd_mod]

% uname -a
Linux dev9.my-comp.com 2.4.20-28.9BOOT #1 Thu Dec 18 13:27:13 EST 2003 i686 
i686 i386 GNU/Linux

I have ip tables in 2.4.20-28.9
% ls -l /lib/modules/2.4.20-28.9/kernel/net/
total 68
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 8021q
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 appletalk
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 atm
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 ax25
drwxr-xr-x    4 root     root         4096 Jan  6 15:02 bluetooth
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 bridge
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 decnet
drwxr-xr-x    3 root     root         4096 Jan  6 15:02 ipv4
drwxr-xr-x    3 root     root         4096 Jan  6 15:02 ipv6
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 ipx
drwxr-xr-x    5 root     root         4096 Jan  6 15:02 irda
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 netrom
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 rose
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 sched
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 sunrpc
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 tux
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 wanrouter

/lib/modules/2.4.20-28.9/kernel/net/ipv4/netfilter/ip_tables.o

But not under 2.4.20-28.9BOOT/ (there is no ipv?)
% ls -l /lib/modules/2.4.20-28.9BOOT/kernel/net/
total 24
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 8021q
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 ax25
drwxr-xr-x    4 root     root         4096 Jan  6 15:02 bluetooth
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 netrom
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 rose
drwxr-xr-x    2 root     root         4096 Jan  6 15:02 sunrpc


Now, I only have remote access to this server and I don't have access to the 
console at this time. 

Is there a way, I can boot the system with "2.4.20-28.9" instead of "2.4.20-
28.9BOOT". If the system does not come up properly, I should be able to 
reboot with "2.4.20-28.9BOOT" which is working (but no iptables). I have only 
remote power cycle capability.

Could you please suggest a way to get this done?

Note: This is follow-up to the question I earlier posted on "iptables 
v1.2.7a: can't initialize iptables table `filter':"


thanks,
Prince.

