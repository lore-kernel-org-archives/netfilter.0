From: Orion Poplawski <orion@cora.nwra.com>
Subject: Trouble with =?utf-8?b?dWxvZ190ZXN0L2Zwcm9iZS11bG9n?=
Date: Mon, 22 Dec 2014 23:06:35 +0000 (UTC)
Message-ID: <loom.20141223T000132-329@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to get fprobe-ulog working on Fedora 21 machine which no longer
has the old ULOG stuff in the kernel.  I built it using the libipulog compat
wrapper but it fails to initialize the ipulog handle.  So I tried compiling
the ulog_test program and running that.  I managed to get it to run once:

# ./ulog_test 10 0 0       
2048 bytes received
first
Hook=3 Mark=0 len=335 Prefix=Shorewall:fw2net:LOG: 
next
Hook=2 Mark=0 len=84 Prefix=Shorewall:^net2loc:LOG: mac=80:71:1f:80:6f:c3 
next
....

but now it fails much like the fprobe-ulog program does:

# ./ulog_test 10 0 0
ERROR: Unable to create netlink handle: Operation not permitted

And now nfulnl_test doesn't work either (it did before):

# ./nfulnl_test
unbinding existing nf_log handler for AF_INET (if any)
binding nfnetlink_log to AF_INET
binding this socket to group 0
no handle for grup 0

No idea what to look for here.

- Orion

