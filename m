From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: ip_net_ftp  message !
Date: Mon, 03 Jun 2002 17:49:28 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFB5ED0.1020204@inbox.lv>
References: <Pine.LNX.4.33.0206031349460.4790-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.samba.org

hi,

yes..:)... sorry for being a little cryptic ;)... but u guessed it right 
!..so i will summarize my 2 Question in this listing-->
1)i am getting these messages in my /var/log/messages..

  iptables v1.2.7-20020423 with  kernel 2.4.18 & patched htb3.3-020512 & 
imq-2.4.18...
May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840 
&ip_conntrack_lock not readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_nat_core.c:739
&ip_conntrack_lock_R71150de5 readlocked
May 30 05:10:04 cab1 kernel: ASSERT ip_conntrack_core.c:91
&ip_conntrack_lock_R71150de5 readlocked

this pattern message is being received every minute. !.. this system is 
on RH-7.2 with 512mb ram & has been running for a month now but the 
mesages started coming since may 30 !...

2) while insmod ip_nat_ftp(after ip_conntrack_ftp) & i got this message 
on RH-7.3(using RH-7.3 for 1st time !).. the kernel was downloaded from 
ftp.kernel.org & iptables v1.2.7-2002528 -->
ASSERT ip_conntrack_core.c:541 & ip_conntrack_lock not read locked !

i have similar configuration done on different pc(with rh7.2) with 
various iptables veriosn but didnt get any of the errors mentioned above !

ur help is my guidance...
regards
A.H


