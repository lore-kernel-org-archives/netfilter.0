From: maillist <maillist@tnss.com>
Subject: Help Martians are attacking
Date: Sun, 14 Sep 2003 01:24:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F640995.2FD00934@tnss.com>
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

Is there any way to get more info, using iptables or the kernel about
the martians?

Can someone clarify the difference between source and from in the log
message?

kernel - kernel generated messages matched ll header:
00:50:bf:70:68:98:00:e0:d0:01:06:ec:08:00
kernel generated messages matched martian source x.x.x.1 from 127.0.0.1,
on dev eth1
kernel - kernel generated messages matched ll header:
ff:ff:ff:ff:ff:ff:00:e0:d0:01:06:ec:08:00
kernel - kernel generated messages matched martian source x.x.x.0 from
127.0.0.1, on dev eth1

-- 
Arno Karner aka Behind the Muffs
West 7th St., St. Paul aka smell, Minn
http://tnss.com/noise_stink

