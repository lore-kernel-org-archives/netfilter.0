From: Paul Willard <paulw@monarch.co.nz>
Subject: What's my src?
Date: Tue, 14 Dec 2004 14:55:28 +1300
Message-ID: <41BE4810.9080105@monarch.co.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Netfilter Users (List)" <netfilter@lists.netfilter.org>, Shorewall List <shorewall-users@lists.shorewall.net>

What is my source?
tail /var/log/messages
Dec 14 14:53:14 rama-kandra kernel: Shorewall:all2all:REJECT:IN= 
OUT=eth3 SRC=203.96.213.73 DST=203.152.118.23 LEN=288 TOS=0x00 PREC=0x00 
TTL=64 ID=73 DF PROTO=UDP SPT=500 DPT=500 LEN=268

doesn't match tcrules
4       202.37.230.93   0.0.0.0/0       udp     500

how does the kernel decide which src to use?

Ultimately I want all UDP 500 to use src 202.37.230.93

P.


