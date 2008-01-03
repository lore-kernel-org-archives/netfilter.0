From: Ben Lentz <BLentz@channing-bete.com>
Subject: Re: conntrack accounting
Date: Thu, 03 Jan 2008 13:12:11 -0500
Message-ID: <477D257B.4060901@channing-bete.com>
References: <477704CB.8030809@channing-bete.com> <477D0553.4010906@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=channing-bete.com;
	s=smtp; t=1199383928; bh=nawTh692zNxhHIvcZh6/0OOBuUj1s2EMIIZpRrMI59
	4=; h=DomainKey-Signature:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-OriginalArrivalTime:X-Antivirus; b=rCZ
	GwSEZfOaUdHOvJdl2JRsje6O4dYPK+Dxo/8jUS41L+4nJRBvvRKPOwoB6r6LM7K+7sk
	5f91SK+hETgA8QWw==
In-Reply-To: <477D0553.4010906@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


> I just committed a patch to SVN which implements this for the statistics
> mode. Have a look at the doc/stats/conntrackd.conf example file and
> enable logging to give it a try. This will be available in the upcoming
> conntrack-tool 0.9.6 release. Don't forget to run conntrackd with the -S
> option.
>   
This sounds great! However, I appear to be having some trouble. I 
checked out, built, and installed conntrack-tools 0.9.6 7164 and 
libnetfilter_conntrack-0.0.87 7164 and am running conntrackd -S. I still 
have libnfnetlink-0.0.30. I don't seem to be getting any statistics 
logging either in Syslog mode or LogFile mode.

- If I set the Stats section to Syslog on, it seems to crash on the 
first attempt to log:
select(5, [3 4], NULL, NULL, {0, 199092}) = 1 (in [4], left {0, 111000})
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], NULL, 8) = 0
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
msg_iov(1)=[...], msg_controllen=0, msg_flags=0}, MSG_PEEK) = 164
recvfrom(4, ""..., 8192, 0, {sa_family=AF_NETLINK, pid=0, 
groups=00000004}, [12]) = 164
time(NULL)                              = 1199383171
open("/etc/localtime", O_RDONLY)        = 6
fstat64(6, {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
fstat64(6, {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0xb7f97000
read(6, ""..., 4096)                    = 3519
close(6)                                = 0
munmap(0xb7f97000, 4096)                = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
stat64("/etc/localtime", {st_mode=S_IFREG|0644, st_size=3519, ...}) = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

- If I set the Stats section to Logfile on (or LogFile filename), it 
doesn't crash, but generates a similar error each time it goes to log a 
connection. I can correlate connections about to close with
$ sudo watch --interval=0.1 'cat /proc/net/ip_conntrack | grep 
"^[a-z]\{3\} *[0-9]* *0"'

to errors in a strace on conntrackd:
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [INT TERM CHLD], NULL, 8) = 0
gettimeofday({1199383388, 670177}, NULL) = 0
gettimeofday({1199383388, 670286}, NULL) = 0
select(5, [3 4], NULL, NULL, {0, 198979}) = 1 (in [4], left {0, 47000})
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], NULL, 8) = 0
recvmsg(4, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
msg_iov(1)=[...], msg_controllen=0, msg_flags=0}, MSG_PEEK) = 164
recvfrom(4, ""..., 8192, 0, {sa_family=AF_NETLINK, pid=0, 
groups=00000004}, [12]) = 164
recvfrom(4, 0xbfae01e0, 8192, 0, 0xbfae01ac, 0xbfae01b8) = -1 EAGAIN 
(Resource temporarily unavailable)
rt_sigprocmask(SIG_UNBLOCK, [INT TERM CHLD], NULL, 8) = 0
gettimeofday({1199383388, 822810}, NULL) = 0
gettimeofday({1199383388, 822856}, NULL) = 0

Configuration file is as follows:
$ grep -v '^$\|^#\|^\W#' /etc/conntrackd/conntrackd.conf
General {
        HashSize 8192
        HashLimit 65535
        LogFile on
        Syslog off
        LockFile /var/lock/conntrack.lock
        UNIX {
                Path /tmp/sync.sock
                Backlog 20
        }
        SocketBufferSize 262142
        SocketBufferSizeMaxGrown 655355
}
Stats {
        LogFile on
        Syslog off
}
IgnoreTrafficFor {
}
IgnoreProtocol {
}

Platform is CentOS 5, kernel 2.6.18.

Please let me know if I've done something dumb or if there's anything I 
can do to provide more useful debugging information. It's been a long 
while since I've been in gdb, so I might need some help with that...
