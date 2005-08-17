From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: netfilter log target kills the computer
Date: Wed, 17 Aug 2005 10:45:20 +0800
Message-ID: <013101c5a2d5$b5f233d0$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Anyone notice that the log target is really too heavy ? 

I have seen various mishaviour to my Celeron 2.4 GHz
machine ( fully dedicated as a firewall machine ) if I turn
on logging. I am not sure if it is due to netfilter logging per se
or due to me running syslogd to remote the log messages over 
the network. But in any case, once there is heavy iptabbles logging
activities, the machine totally misbehaves. 

Besides the most obvious solutions ( ie to turn it off or get a faster 
computer ), any words of advise or recommendation ?

Cheers.




