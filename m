From: Askar <askarali@gmail.com>
Subject: strange traffic
Date: Fri, 24 Sep 2004 21:53:59 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e504092408533ebc42d7@mail.gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

hi all 
can someone tell me  what type of traffic is this....
#tcpdump -n port not 22 -c 100 and -t host xxx.xx.xx.xx

xx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36
xxx.xx.xxx.xx.28332 > 217.165.224.42.32706: udp 36

xxx... is our client IP we are getting lot of like these.. days with
different source ip each time.
regards

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
yer life a little easier)

