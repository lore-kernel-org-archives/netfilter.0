From: tlhackque <tlhackque@yahoo.com>
Subject: -m recent recently broken?
Date: Wed, 28 Nov 2012 11:01:52 -0500
Message-ID: <50B63570.7090008@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1354118514; bh=syHwoEtFOI+6n8f/4DQRETzhWo947O6y9D8TMfFs300=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=aui7flwBSDP+OrX/moUBSDTJPXZioJKxnMv3ui0+6Vy2H0lvJ8xAM3jGzAWNAmnGRwEFxJIjjEtujcfVNZuDusCNMAUfnSAlGqldPowO7y0hY0AZMLa57WVev0kjjAYC9FCuDJpGew0B8Bogu0xcjyUMs5U0cgL0XF2V16UXF0w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I recently noticed that a script that sets up a filter is failing. It 
may have started failing when I updated iptables to V1.4.15 - I've 
updated again to 1.4.16.3 (current, so far as I know).

The culprit seems to be libxt_recent.  I've reduced the case to this:

Environment:
-------------------
cat /proc/sys/kernel/osrelease  # Yes, I'd like to update, but can't at 
the moment...
2.6.22.14-72.fc6

/sbin/ip6tables --version
ip6tables v1.4.16.3

Failing command:
-------------------------
/sbin/ip6tables -A INPUT -p tcp --dport 333 -m recent --name white6 
--rcheck -j ACCEPT
ip6tables: No chain/target/match by that name.

Additional data:
----------------------
If I remove "-m recent --name white6 --rcheck", the command is accepted. 
(But of course is quite useless.)

/proc/net/ipt_recent does not contain white6 (adding this rule should 
create it).
   >> Could it be that libxt_recent wants the newer location 
(/proc/net/xt_recent)?

iptables was built with no options.  /sbin/ip6tables is a symbolic link 
to ../usr/local/sbin/ip6tables.

strace reveals (edited to remove clutter):
...
stat64("/usr/local/lib/xtables/libxt_recent.so", {st_mode=S_IFREG|0755, 
st_size=21699, ...}) = 0
open("/usr/local/lib/xtables/libxt_recent.so", O_RDONLY) = 3
...(mmap, close)
socket(PF_INET6, SOCK_RAW, IPPROTO_RAW) = 3
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */, 
"filter\0\0\250R\366\267\267\342\22\0\377\377\377\377\300\357\21\0000\211\4\10P\366\21\0"..., 
[84]) = 0
getsockopt(3, SOL_IPV6, 0x41 /* IPV6_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
[22328]) = 0
setsockopt(3, SOL_IPV6, 0x40 /* IPV6_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 22888) 
= -1 ENOENT (No such file or directory)
close(3)                                = 0
write(2, "ip6tables: No chain/target/match"..., 47ip6tables: No 
chain/target/match by that name.) = 47

-- 
This communication may not represent my employer's views,
if any, on the matters discussed.

