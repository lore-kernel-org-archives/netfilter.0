From: "-iYung-" <iyung@ibs.ath.cx>
Subject: 2 WAN port,, 1 LAN port on one machine
Date: Thu, 26 Feb 2004 19:33:19 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3100.202.171.14.2.1077798799.squirrel@jkt.pearlenergy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Currently i have one linux bos as internet gateway, and i have three
different LAN segemnts connected to the machine.

a. 172.16.30.0/24
b. 172.16.40.0/24
c. 159.163.123.0/24

What i wanted to do is, I would like to have 2 WAN port and 1 LAN port.

               LINUX
             -----------
            |           |
            |           |---eth0 (a.a.a.a)
            |           |
    eth1 ---|           |
            |           |
            |           |---eth1 (b.b.b.b)
            |           |
             -----------

all segments connected to one router, and the router will route everthing
to 0.0.0.0/0.0.0.0 to eth1 (c.c.c.c)

My question is, was it possible if:

a. all internet traffic request coming from segment 172.16.30.0/24 and
159.163.123.0/24 will go out from eth0

and...

b. all internet traffic request coming from segment 172.16.40.0/24 will go
out from eth1

thank you.
julius.

