From: kilho Kim <kilho8667@yahoo.com>
Subject: IP Tunnel+IP Tables.
Date: Thu, 9 Oct 2003 15:35:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009223503.69129.qmail@web11406.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a question regarding the IPIP on linux.
Following is the current situation we have.
Diagram below.


             Linux A             Linux B
             ________            _______
             |      |            |     |---
Internet ----|      |--private---|     |--- Client
             |______|  network   |_____|--- machines
                       using public IP

Linux A has two interfaces, one is ethernet connected
to internet, and the other interface is token ring
adapter. Linux B has token ring adapter connected to
Linux A, and Linux B has three ethernet interfaces and
clients will connect to Linux B to use internet.

From above, it isn't that bad to give our clients
internet access through our network, but here comes
the problems. The problem we're facing is we have huge
subnet (even though main idea is the same as Box A &
Box B) and we are using public IP addresses as our
private network's ip addresses. For this reason, we
are trying to hide our network from the clients. Yes
there maybe some case that the client can actually try
to access the host that has the duplicated ip address
as one of our machine does. The way we try to solve
this is by using the tunneling between the linux A and
linux B.
My question is if it's possible to setup the tunnel
between the interface that connected to internet on
Linux A and the interfaces that connected to client
machines on Linux B.

I can make tunnel between the interfaces that
connected to the internal network on Linux A and Linux
B, but I couldn't quite make above senario working.

At this point, I'm not even sure if IPIP supports
above configuration.

Some reason, I can't move or introduce any other
machines. If you have any suggestion or how the
routing table should look like, feel free to list here
please.

Thanks in advance.



__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

