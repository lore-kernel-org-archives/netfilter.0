From: "Giacomo" <delleceste@gmail.com>
Subject: NAT Filter programming simple examples
Date: Sat, 24 Sep 2005 15:35:28 +0200
Message-ID: <003101c5c10c$d63e90c0$0300a8c0@giacomino>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter lists <netfilter@lists.netfilter.org>

Good morning.
If anyone in the news was interested, i communicate that i have finished 
developing
a simple ipv4 packet filter with nat/masquerading functionality.

Kernel programming encompasses these topics:

- Netlink sockets for user/kernel communication;
- Netfilter hook registration;
- getsockopt() function registration;
- Kernel module programming;
- Network programming (socket buffers, network functions...)
- /proc interface read/write example;
- kernel linked lists and related timers;
- ....

Userspace programming:

- Netlink communication (a simple netlink interface has been written);
- Pipes/semaphores for communication between parent and son processes;
- Networking functions;
- signals;
- unbuffered Input from terminal;
- ...

If anyone interested visit

http://www.giacomos.it/ipfire/index.html

and then if you find something interesting let me know!

delleceste@gmail.com

Giacomo S.



