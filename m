From: Dengke Du <dengke.du@windriver.com>
Subject: arptables: failed start because different return by getsockopt in
 libarptc_incl.c
Date: Mon, 14 Nov 2016 17:50:07 +0800
Message-ID: <110de54a-70fb-b8f3-2221-04b2a2d7c5b7@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all

When I run command on x86 and x86-64:

     arptables -P INPUT ACCEPT

There are fine for me.

When I run the above command on x86-64 with multilib:

 >>ERROR: Policy for `INPUT' offset 448 != underflow 0
 >>arptables: Incompatible with this kernel

I used gdb follow it and found the difference that at the start of the 
program in function TC_INIT in libarptc.incl.c ( line: 236 ):

     getsockopt(sockfd, TC_IPPROTO, SO_GET_INFO, &info, &s)

It stored socket option information in info.

On x86 and x86-64:

info {name = "filter", '\000' <repeats 25 times>, valid_hooks = 7,
   hook_entry = {0, 224, 448}, underflow = {0, 224, 448}, num_entries = 4,
   size = 924}
~~~~~~~~~~~~~~~~~~~~~
ldd `which arptables`:

     linux-gate.so.1 (0xb7789000)
     libc.so.6 => /lib/libc.so.6 (0x48660000)
     /lib/ld-linux.so.2 (0x4863a000)
~~~~~~~~~~~~~~~~~~~~~

On x86-64 with multilib:

info {name = "filter", '\000' <repeats 25 times>, valid_hooks = 7,
   hook_entry = {0, 0, 0}, underflow = {0, 0, 0}, num_entries = 4, size 
= 924}

~~~~~~~~~~~~~~~~~~~~~
ldd `which arptables`:

     linux-gate.so.1 (0xf7794000)
     libc.so.6 => /lib/libc.so.6 (0xf75d6000)
     /lib/ld-linux.so.2 (0xf7795000)
~~~~~~~~~~~~~~~~~~~~~

what wrong with it?
// Dengke






