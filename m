From: nikhil hegde <ndhegde@yahoo.com>
Subject: ipqueue related problem. large file transfer not taking place.
Date: Thu, 16 Sep 2004 06:55:43 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916135543.8668.qmail@web20828.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,
I am a beginner and I have this problem:
I installed fedora core 2 and iptables 1.2.11 and
iptables-devel for 1.2.11. In my application when i
try to scp or sftp any file larger than few bytes the
transfer is not taking place.
The transfer "stalls" at 132KB typically. I can
successfully transfer files of the order of bytes.

I tried:
-increasing netlink buffer size(rite now i have kept
it to 65535 * 4)
-increasing the size of the buffer to which i
read(ipq_read ) thinking that the other end is writing
to netlink buffer very fast.

But nothing seems to have worked. could anyone please
help me?

Thanks and regards
Nikhil




		
__________________________________
Do you Yahoo!?
Yahoo! Mail - You care about security. So do we.
http://promotions.yahoo.com/new_mail

