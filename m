From: Askar <askarali@gmail.com>
Subject: blocking msn
Date: Thu, 23 Dec 2004 20:13:02 +0500
Message-ID: <a0f69e50412230713fbf2ec4@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hey here is quick question let suppose i drop MSN with the below rule

#iptables -A FORWARD -p tcp --dport 1863 -j DROP

but its not enough, if 1863 is blocked it tries to use port 80.

any work around ?
regards

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

