From: "blkcore" <netfilter@blackcore.net>
Subject: 2.4.20 - ntfilter (owner) problems
Date: Mon, 6 Jan 2003 23:37:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006301c2b61f$9f88cfa0$0200a8c0@void>
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

This is my first time posting, I am not sure if I'm in the right place, so
correct me if I'm wrong.
I recently compiled 2.4.20 with netfilter support, with the owner module (-m
owner), and after several attempts of trying to use it (worked for 2.4.18),
it gives an error.

[root@scsi1 slinksi]# iptables -I OUTPUT -m owner --uid-owner root
iptables: Target problem

setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 912) = -1 EINVAL
(Invalid argument)
(strace)
This is enabled in the netfilter section, compiled in, not as a module, I
also have grsecurity support (1.9.8)
.
Any help is appreciated, I am going to try 2.4.19.


