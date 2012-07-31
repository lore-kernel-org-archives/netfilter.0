From: Peter LaDow <petela@gocougs.wsu.edu>
Subject: Process Hang
Date: Mon, 30 Jul 2012 17:38:28 -0700
Message-ID: <CAN8Q1Ec9WUPh4mKw6Yn5G5hstzYxcJOKM8r_eGchjGo+h6FFLA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=DM1mo20VjnOybXQSKE6tHJntiH/8x8JGXt9SCNzHVks=;
        b=eqYglsqgxgL3VmiM/6c46ZKMYvhsDzK6nu+91JyC7UulVFzbB4FgJMROJzTjT/kLm1
         gV8uIfgFFEJjls+zLk7riuTmY2cRh46HzVlNcAqMQLVbCzwRyuRXo7GcctWkkH5cHK9K
         XQJ1H9y7x2o17FchFTkYLYfGCnYr8U4DCP0dvoGJ6CeIliVT0hTxXvSV/3SlGxomj/Qo
         JmKxpYuC5TDgzDI0qf/22d3wQKgXgsQWX1jE5CWp2MhRlaCCwXleI9aS45OqM9PUT3GW
         QhkFRtSfOmMqoFU7qNL6YvAkUeFQlprkoFHViM3bPzFHTnPr1IIt2PAPbLLHDuV7o0Tk
         p5bw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I posted this on the RT mailing list, but haven't heard back.  And
after some digging, I think perhaps this may be related to the
netfilter code.  I presume this is the correct list (rather than
netfilter-dev).  If not, please let me know.

We are running 3.0.36-rt57 on a powerpc box.  During some testing with
heavy loads and interfaces coming up/going down (specifically PPP), we
have run into a case where iptables hangs and cannot be killed.  It
requires a reboot to fix the problem.  We are using 3.0.36-rt57 along
with iptables 1.3.8.

We can re-create the problem, but it takes 5-6 hours each time.  So
debugging this has been very difficult.

Connecting the BDI and debugging the kernel, we get:

#0  get_counters (t=0xdd5145a0, counters=0xe3458000)
    at include/linux/seqlock.h:66
#1  0xc026b4ac in do_ipt_get_ctl (sk=<value optimized out>,
    cmd=<value optimized out>, user=0x10612078, len=<value optimized out>)
    at net/ipv4/netfilter/ip_tables.c:918
#2  0xc022226c in nf_sockopt (sk=<value optimized out>, pf=2 '\002',
    val=<value optimized out>, opt=<value optimized out>, len=0xdd4c7d4c,
    get=1) at net/netfilter/nf_sockopt.c:109
#3  0xc0236b1c in ip_getsockopt (sk=0xdf071480, level=<value optimized out>,
    optname=65, optval=0x10612078 <Address 0x10612078 out of bounds>,
    optlen=0xbfbe0c2c) at net/ipv4/ip_sockglue.c:1308
#4  0xc02522a8 in raw_getsockopt (sk=0xdf071480, level=<value optimized out>,
    optname=<value optimized out>, optval=<value optimized out>,
    optlen=<value optimized out>) at net/ipv4/raw.c:811
#5  0xc01f4c38 in sock_common_getsockopt (sock=<value optimized out>,
    level=<value optimized out>, optname=<value optimized out>,
    optval=<value optimized out>, optlen=<value optimized out>)
    at net/core/sock.c:2157
#6  0xc01f2df8 in sys_getsockopt (fd=<value optimized out>, level=0,
    optname=65, optval=0x10612078 <Address 0x10612078 out of bounds>,
    optlen=0xbfbe0c2c) at net/socket.c:1839
#7  0xc01f45b4 in sys_socketcall (call=15, args=<value optimized out>)
    at net/socket.c:2421

It seems to be stuck in __read_seqcount_begin.  From include/linux/seqlock.h:

static inline unsigned __read_seqcount_begin(const seqcount_t *s)
{
        unsigned ret;

repeat:
        ret = ACCESS_ONCE(s->sequence);
        if (unlikely(ret & 1)) {
                cpu_relax(); <----- It is always here
                goto repeat;
        }
        return ret;
}

Now, digging through things, it seems the lock is acquired via
xt_write_recseq_begin, which only occurs in a few places.  The only
place that looks suspicious is in ipt_do_table.  There is a do while
loop that is preceded by xt_write_recseq_begin (and terminated with
xt_write_recseq_end).  Our suspicion that we may have a case where it
is spinning in side this loop, but we aren't sure how to determine if
this is the case.  Our first thought is the continue statement near
the top of the loop that could keep jumping to the end of the loop,
and since acpar.hotplug never changes, this loop never exits.

(My speculations below are uninformed, since I don't know exactly how
netfilter works.  They are based upon the variable and function names.
 If I'm way off, help would be appreciated.)

However, it seems this would only be the case if none of the table
entries match the the ip of the skb (the call to ip_packet_match).  Or
if the table becomes corrupted and the table entry keeps pointing to
itself.

I've since turned on netfilter debugging and I'm hoping for a failure
soon that I can use to get more information.  But any hints on what
could be the problem would be greatly appreciated.

Pete
