From: Rainer Sabelka <sabelka@iue.tuwien.ac.at>
Subject: Re: conntrackd causes kernel panic
Date: Mon, 9 Jun 2008 19:24:59 +0200
Message-ID: <200806091925.00809.sabelka@iue.tuwien.ac.at>
References: <200806091607.53861.sabelka@iue.tuwien.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200806091607.53861.sabelka@iue.tuwien.ac.at>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 09 June 2008 16:07, Rainer Sabelka wrote:
> Hi,
>
> I'm using conntrackd and keepalived (for a pair of redundant firewalls in
> active/backup configuration) and from time to time I experience a kernel
> panics.
> I'm new to conntrackd, so its likely that I made just some mistakes in my
> configuration.
>
> I'm getting these kernel panics when keepalived switches the backup host to
> active.
> Manually I can trigger the kernel panic when I execute "conntrackd -c" on
> the backup host (sometimes "conntrackd -c" executes sucessfully, but it
> crashes at the latest when I repeat the command a few times).
>
> This is my setup:
> * Ubuntu Linux with kernel 2.6.24-18-server
> * libnfnetlink 0.0.38 (compiled from sources)
> * libnetfilter-conntrack 0.0.94 (compiled from sources)
> * conntrack-tools 0.9.7 (compiled from sources)

Some additional information:

I've now turned on logging in conntrackd.conf to see if I can get some more 
information on my problem.

1.) I can see lots of the following messages in the logfile:

Jun  9 18:52:49 fw1b conntrack-tools[7385]: Received seq=1213034051 before 
expected seq=1213034052

2.) When I do "conntrackd -c" I get: 
Jun  9 18:52:50 fw1b conntrack-tools[10678]: committing external cache
Jun  9 18:52:50 fw1b conntrack-tools[10678]: commit: Invalid argument
[...]
Jun  9 18:52:50 fw1b conntrack-tools[10678]: commit: Cannot allocate memory
[...]
Jun  9 18:52:50 cfw1b conntrack-tools[10678]: Committed 2 new entries
Jun  9 18:52:50 cfw1b conntrack-tools[10678]: 89 entries can't be committed

3.) Since I turned on logging "conntrackd -c" now seems to be more stable. I 
the first moment I thought my problem was fixed. But the I started a script 
which executed this command repeatedly in a loop, which eventually trigered 
an kernel oops:

# while sleep 1 ; do conntrackd -c ; done
 fw1b kernel: [ 6714.379206] ------------[ cut here ]------------
 fw1b kernel: [ 6714.381285] invalid opcode: 0000 [#1] SMP
 fw1b kernel: [ 6714.388793] Process kjournald (pid: 2267, ti=c79ac000 
task=c5121140 task.ti=c79ac000)
 fw1b kernel: [ 6714.388824] Stack: c5c40a80 00000000 c5c40a80 00000000 
c1422000 c5121140 c50e0000 00000002
 fw1b kernel: [ 6714.389418]        c79adf84 c79adf7c 00000000 c04980e0 
c049b480 c049b480 c049b480 c79adf88
 fw1b kernel: [ 6714.390152]        00000286 c013b547 c79882ec ffffffff 
c79882ec 00000286 c013b5c5 00000286
 fw1b kernel: [ 6714.391701] Call Trace:
 fw1b kernel: [ 6714.392871]  [<c013b547>] lock_timer_base+0x27/0x60
 fw1b kernel: [ 6714.393652]  [<c013b5c5>] try_to_del_timer_sync+0x45/0x50
 fw1b kernel: [ 6714.394210]  [<c8ace740>] kjournald+0xa0/0x200 [jbd]
 fw1b kernel: [ 6714.394780]  [<c0145fc0>] autoremove_wake_function+0x0/0x40
 fw1b kernel: [ 6714.395354]  [<c8ace6a0>] kjournald+0x0/0x200 [jbd]
 fw1b kernel: [ 6714.395907]  [<c0145d02>] kthread+0x42/0x70
 fw1b kernel: [ 6714.396440]  [<c0145cc0>] kthread+0x0/0x70
 fw1b kernel: [ 6714.396994]  [<c010900b>] kernel_thread_helper+0x7/0x10
 fw1b kernel: [ 6714.397580]  =======================
 fw1b kernel: [ 6714.398150] Code: ff f3 90 8b 03 a9 00 00 20 00 0f 84 1f f5 
ff ff eb ef 0f 0b eb fe f3 90 8b 03 a9 00 00 20 00 0f 84 af f3 ff ff eb ef 0f 
0b eb fe <0f> 0b eb fe 0f 0b eb fe 56 53 89 d3 8d 34 90 eb 16 8d b4 26 00
 fw1b kernel: [ 6714.399468] EIP: [<c8acb958>] 
journal_commit_transaction+0xd88/0xd90 [jbd] SS:ESP 0068:c79adf2c

At firs glance this oops seems to unrelated because it happens within 
kjournald. But is triggered by the conntrackd -c command, so I suspect 
(rather naively) that conntrackd calls some kernel function which mixes up 
some kenel memory causing a crash later on.

Does anybody have a hint what could be wrong with my setup?

Best regards,
-Rainer
