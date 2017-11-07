From: Muneyuki KAWATANI <kawatani.muneyuki@lab.ntt.co.jp>
Subject: Is libnetfilter_queue works in container?
Date: Tue, 7 Nov 2017 19:03:36 +0900
Message-ID: <49e33b87-e57b-b884-0e56-900c0bb821c9@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

  Hi, all.

  I'm developing a user-land application mangles packets
by using libnetfilter_queue.
  The prototype works well in bare-metal's and VMs, but
in a container environment. Is libnetfilter_queue (and
some packages libnetfilter_queue depends on) works in
container?

  The problems are as follows.

1. The ip-header of the packet given via send-hook is null(0).
    In the bare-metal and VM, the ip-header is set correctly.

2. The device index got by using nfq_get_out_dev is always 0.
    The device numbered 0 is loop-back interface, and it's not
    correct. In the bare-metal and VM, device index can be got
    correctly (ie. 1 or 2 or..)


  The environment to reproduce this problem is as follow.

* To hook packet sending, my prototype uses mangle target's
   POSTROUTING chain. Command is like this.

   iptables -t mangle -I POSTROUTING -j NFQUEUE --queue-num xxx

* Container environment is this.

Client:
  Version:      1.12.6
  API version:  1.24
  Go version:   go1.6.2
  Git commit:   78d1802
  Built:        Tue Jan 31 23:35:14 2017
  OS/Arch:      linux/amd64

Server:
  Version:      1.12.6
  API version:  1.24
  Go version:   go1.6.2
  Git commit:   78d1802
  Built:        Tue Jan 31 23:35:14 2017
  OS/Arch:      linux/amd64

* Container's OS is this.

Ubuntu 16.04.3 LTS \n \l

Linux 83108e3da998 4.4.0-96-generic #119-Ubuntu
SMP Tue Sep 12 14:59:54 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux


  Thanks.

