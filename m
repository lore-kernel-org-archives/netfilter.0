From: Alessandro Vesely <vesely@tana.it>
Subject: H: netfilter frozen in recvmsg
Date: Wed, 05 May 2010 19:23:41 +0200
Message-ID: <cone.1273080221.526801.26283.1000@north>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1273080221; bh=eq0XY9cmZytlu4X3b27ZDQL6NTz9C4sbqvZmfxfVgPY=;
	l=2705;
	h=Message-ID:From:To:Date:Mime-Version:Content-Transfer-Encoding;
	b=aycWhtfgS/YMnkqczZWdkIJEdL+QymQffOU7XK2tL3fUG+ntWI5L8S/E17V9pXygA
	 WeWbm89Bb1n7iqUPdBPZ1rqb7o8Qj+XSDJVu9e+zfuUPH3JasKf0x0F6x0LL5hASAq
	 Kawe2FOl0N/I608hPoMYWPWNiHro6BctIgueTj3g=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
yesterday my netfilter client suddenly froze. I wasn't even able to kill it. 
The following is a strace:

recvmsg(4, 0x7fffffffa770, 0)           = ? ERESTARTSYS (To be restarted)
--- SIGABRT (Aborted) @ 0 (0) ---
stat("/etc/localtime", {st_mode=S_IFREG|0644, st_size=2652, ...}) = 0
sendto(6, "<26>May  4 21:24:37 ibd-judge[403"..., 55, MSG_NOSIGNAL, NULL, 0) 
= 55
rt_sigreturn(0x7fbc6c21c9e0)            = -1 EINTR (Interrupted system call)
recvmsg(4, 0x7fffffffa770, 0)           = ? ERESTARTSYS (To be restarted)
--- SIGTERM (Terminated) @ 0 (0) ---
rt_sigreturn(0xf)                       = -1 EINTR (Interrupted system call)
recvmsg(4, 0x7fffffffa770, 0)           = ? ERESTARTSYS (To be restarted)
--- SIGTERM (Terminated) @ 0 (0) ---
rt_sigreturn(0xf)                       = -1 EINTR (Interrupted system call)
recvmsg(4, 0x7fffffffa770, 0)           = ? ERESTARTSYS (To be restarted)
+++ killed by SIGKILL +++

(The log line on ABRT is written by the signal handler. I didn't put any 
SA_RESTART for the sigaction of those signals, but it didn't get out of the 
call.)

The relevan line of code is

        while (caught_signal == 0 &&
                (rv = recv(fd, buf, sizeof(buf), 0)) >= 0)

Under normal circumstances, it does

recvfrom(4, 
"d\0\0\0\0\3\0\0\0\0\0\0\0\0\0\0\2\0\0\0\v\0\1\0\0\0\f\241\10\0\1\0\10"..., 
8192, 0, NULL, NULL) = 100
pread(3, 
"\0\0\0\0\1\0\0\0\23\3\0\0\213\t\0\0\230\4\0\0`\0\300\1\1\5\370\17\264\17P\2 
\f"..., 4096, 3223552) = 4096
sendmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{" 
\0\0\0\1\3\1\0ZW\341K\0\0\0\0\0\0\0\0\f\0\2\0\0\0\0\1\0\0\f\241"..., 32}], 
msg_controllen=0, msg_flags=0}, 0) = 32
recvfrom(4, 
"@\0\0\0\0\3\0\0\0\0\0\0\0\0\0\0\2\0\0\2\v\0\1\0\0\0\325\274\0\0\3\0\10"..., 
8192, 0, NULL, NULL) = 64
sendmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{" 
\0\0\0\1\3\1\0[W\341K\0\0\0\0\0\0\0\2\f\0\2\0\0\0\0\1\0\0\325\274"..., 32}], 
msg_controllen=0, msg_flags=0}, 0) = 32
recvfrom(4, 
"@\0\0\0\0\3\0\0\0\0\0\0\0\0\0\0\2\0\0\2\v\0\1\0\0\0\325\275\0\0\3\0\10"..., 
8192, 0, NULL, NULL) = 64
sendmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000000}, 
msg_iov(1)=[{" 
\0\0\0\1\3\1\0\\W\341K\0\0\0\0\0\0\0\2\f\0\2\0\0\0\0\1\0\0\325\275"..., 
32}], msg_controllen=0, msg_flags=0}, 0) = 32

Note that recvfrom rather than recvmsg. This is a debian lenny, with NETLINK 
v0.30. Both queues are configured with

        nfq_set_mode(qh, NFQNL_COPY_PACKET, 20)

It is the first time I see that freezing. Is it a known issue? What should I 
have looked for to diagnose it? Any hint?

TIA
Ale

