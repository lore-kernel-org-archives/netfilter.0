Received: from mx0b-0019e102.pphosted.com (mx0a-0019e102.pphosted.com [67.231.149.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D164C85
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 05:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722231871; cv=none; b=LSWM+ITDKP9dZYcHhiQtT/9Tw/3InYf8dHRJMe/DJleGFl9vVXP+Qaapv9W4aVHQyvPAVQg6Ae3hWfGtAEnWPtQnQ0VaKhwnsXOU9iwEx8MLaR/f6SoJl2iY4qrKq8XpNFiCUWeggEz3xemAbgBsCrVUTXP5eI3440uyfk7JJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722231871; c=relaxed/simple;
	bh=WS7rWhxyZyghq/idAiKfREdVJ4vZbPYO0msof0PTIUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dm76fPucm5zt4W22CwYdY2EUA6NxdJwY4HNTiVHFJDNuQ24KjMvql6VwqngMRQEnFuUMoxe7v9dNzLz8OZkXUz25WHZDdJ8UlQXf5yYjtw1hKS6Cl1ahDWppjvku+QN/K/YzLp4yw5vlEiugWoYNn2CASQWGiKUVxs64+QINHMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com; spf=pass smtp.mailfrom=motorolasolutions.com; dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b=wtmbZK/2; arc=none smtp.client-ip=67.231.149.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motorolasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=motorolasolutions.com header.i=@motorolasolutions.com header.b="wtmbZK/2"
Received: from pps.filterd (m0074412.ppops.net [127.0.0.1])
	by mx0a-0019e102.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 46T37sXh025347
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 05:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorolasolutions.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=PPS--2020-03-17;
 bh=9ssEkUZSEuLzabws3qA6TdTL5k3OOqGihN5j1vSDay4=;
 b=wtmbZK/2JCCE8vMTjuf+ncj6WCKf9CpyrKlw0Ufl+xkYAA9vU4+xOVO9V+k2IM6N2YtT
 6FIXyR5p6GjUC3lTZjhXnEHleOjGu5SsFuWrOF55+yLdWzjoh/F9ngJD1mf53ANsO5/E
 UOfWpR9Dmk+Wgjb7MjFuK/e8KjVvroYrbxJo7KDlbDnyXIUfQppvjnJL6kSVlm7Gu69U
 WX4TcRSsVotAT5f99wJpta2niObANEYEI1fq6ER3S7fpLhsUykv1suYYWccxSi5tf1YT
 3/60BHNqIEAgzG5975Jg7GA76aWNMKJM5ilwAENb4PpVk3LHl8RoyYqTVjAaHT2yn0Yg YQ== 
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0019e102.pphosted.com (PPS) with ESMTPS id 40mqap3hyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
	for <netfilter@vger.kernel.org>; Mon, 29 Jul 2024 05:44:22 +0000
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-26118fb0f25so3804365fac.1
        for <netfilter@vger.kernel.org>; Sun, 28 Jul 2024 22:44:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmnr8f+kZRC06zmHoRaupQeffkxqkgegyseUrfgWk0OnJALTFeDPLuNCr5Szhdo5CiySAkBeTahuGN/vgks8UZmgol4udrI5gy
X-Gm-Message-State: AOJu0YywcMV9gO7TtuutZltO5OcrUghyFFHNbbIiXsLj3qVUkaNTLNph
	O91JtKgEILsc4sKg1WI8vLMIFUn2yn/d3VHfo5EXHuvXjCGGwFk6WD7z3F8xh35OsfyKBs1VfzQ
	h6lXYrgeVqLKLZzRZDCZiZpGavsl7kal3Yo9sweKKRSCxrPmLH41iqQeHm7Z8O/LTaMHp+dJyMW
	AO+c9ruiFHnMVqepdj5dFxnPXpqP80yek99SjcmcD85Uo=
X-Received: by 2002:a05:6871:b29:b0:25d:7cc4:caa8 with SMTP id 586e51a60fabf-267d4cf844fmr7395031fac.10.1722231860253;
        Sun, 28 Jul 2024 22:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC6iT/6bIkgRn0ueJ3fq6jKYgMfteRlqsX7RknKIk0fEGYmwMq9NegoETIu15uzq5fd0MnLLqVQSmyVfNe648=
X-Received: by 2002:a05:6871:b29:b0:25d:7cc4:caa8 with SMTP id
 586e51a60fabf-267d4cf844fmr7395014fac.10.1722231859732; Sun, 28 Jul 2024
 22:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
 <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com>
 <20240725021904.GA13051@breakpoint.cc> <CAMp_5HZL85o7frtb+JSw6sq+uLT8V3St0Asz+Z5zqW529UaCMg@mail.gmail.com>
 <614ba217-0f24-434f-9cd1-a98061f951f6@thelounge.net>
In-Reply-To: <614ba217-0f24-434f-9cd1-a98061f951f6@thelounge.net>
From: Tom Isaacson <thomas.isaacson@motorolasolutions.com>
Date: Mon, 29 Jul 2024 17:44:08 +1200
Message-ID: <CAMp_5HaeF7diaCS8TsF0BvrUVjd9yNJ+kT_LZsrX3xxCc_rGMw@mail.gmail.com>
Subject: Re: Unknown option "--to-ports"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: T1_BXVdETq2_s8bVlk3dYPNNIdKj1Hr8
X-Proofpoint-ORIG-GUID: T1_BXVdETq2_s8bVlk3dYPNNIdKj1Hr8
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407290038

I'm not accusing anyone, I was asking for help diagnosing the problem.
Luckily I ignored your suggestions because you were both wrong.

I managed to get strace copied to my device:
# strace iptables -A OUTPUT -m owner --uid 0
execve("/usr/sbin/iptables", ["iptables", "-A", "OUTPUT", "-m",
"owner", "--uid", "0"], 0x7ffa7423d0 /* 29 vars */) =3D 0
brk(NULL)                               =3D 0x55a5afa000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7f8502f000
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such
file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D32961, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 32961, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x7f85026000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libip4tc.so.2", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D31152, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 160296, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f84f=
d1000
mmap(0x7f84fe0000, 94760, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7f84fe0000
munmap(0x7f84fd1000, 61440)             =3D 0
munmap(0x7f84ff8000, 552)               =3D 0
mprotect(0x7f84fe7000, 61440, PROT_NONE) =3D 0
mmap(0x7f84ff6000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) =3D 0x7f84ff6000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libip6tc.so.2", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D31152, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 160296, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f84f=
b8000
mmap(0x7f84fc0000, 94760, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7f84fc0000
munmap(0x7f84fb8000, 32768)             =3D 0
munmap(0x7f84fd8000, 29224)             =3D 0
mprotect(0x7f84fc7000, 61440, PROT_NONE) =3D 0
mmap(0x7f84fd6000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) =3D 0x7f84fd6000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libxtables.so.12", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D59304, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 199720, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f84f=
8f000
mmap(0x7f84f90000, 134184, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7f84f90000
munmap(0x7f84f8f000, 4096)              =3D 0
munmap(0x7f84fb1000, 60456)             =3D 0
mprotect(0x7f84f9e000, 61440, PROT_NONE) =3D 0
mmap(0x7f84fad000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) =3D 0x7f84fad000
mmap(0x7f84faf000, 7208, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7f84faf000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\264\2\0\0\0\0\0=
"...,
832) =3D 832
pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0/\267c\324\361R\25\177\n\177\26\3=
27\322\277\4\211"...,
68, 768) =3D 68
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D1630088, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 1805328, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f84=
dd7000
mmap(0x7f84de0000, 1739792, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7f84de0000
munmap(0x7f84dd7000, 36864)             =3D 0
munmap(0x7f84f89000, 27664)             =3D 0
mprotect(0x7f84f68000, 61440, PROT_NONE) =3D 0
mmap(0x7f84f77000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x187000) =3D 0x7f84f77000
mmap(0x7f84f7d000, 48144, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7f84f7d000
close(3)                                =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7f85024000
set_tid_address(0x7f850240f0)           =3D 25050
set_robust_list(0x7f85024100, 24)       =3D 0
rseq(0x7f850247c0, 0x20, 0, 0xd428bc00) =3D 0
mprotect(0x7f84f77000, 12288, PROT_READ) =3D 0
mprotect(0x7f84fad000, 4096, PROT_READ) =3D 0
mprotect(0x7f84fd6000, 4096, PROT_READ) =3D 0
mprotect(0x7f84ff6000, 4096, PROT_READ) =3D 0
mprotect(0x557a8bc000, 4096, PROT_READ) =3D 0
mprotect(0x7f85033000, 8192, PROT_READ) =3D 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024,
rlim_max=3DRLIM64_INFINITY}) =3D 0
munmap(0x7f85026000, 32961)             =3D 0
newfstatat(AT_FDCWD, "/usr/lib/xtables/libipt_owner.so", 0x7fdac3dc78,
0) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib/xtables/libxt_owner.so",
{st_mode=3DS_IFREG|0755, st_size=3D18904, ...}, 0) =3D 0
getrandom("\x89\xee\xcc\x55\xdc\x6d\x75\xd8", 8, GRND_NONBLOCK) =3D 8
brk(NULL)                               =3D 0x55a5afa000
brk(0x55a5b1b000)                       =3D 0x55a5b1b000
openat(AT_FDCWD, "/usr/lib/xtables/libxt_owner.so", O_RDONLY|O_CLOEXEC) =3D=
 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D18904, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 148048, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f84d=
bb000
mmap(0x7f84dc0000, 82512, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7f84dc0000
munmap(0x7f84dbb000, 20480)             =3D 0
munmap(0x7f84dd5000, 41552)             =3D 0
mprotect(0x7f84dc3000, 65536, PROT_NONE) =3D 0
mmap(0x7f84dd3000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) =3D 0x7f84dd3000
close(3)                                =3D 0
mprotect(0x7f84dd3000, 4096, PROT_READ) =3D 0
socket(AF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
newfstatat(AT_FDCWD, "/proc/net/ip_tables_names",
{st_mode=3DS_IFREG|0440, st_size=3D0, ...}, AT_SYMLINK_NOFOLLOW) =3D 0
statfs("/proc/net/ip_tables_names", {f_type=3DPROC_SUPER_MAGIC,
f_bsize=3D4096, f_blocks=3D0, f_bfree=3D0, f_bavail=3D0, f_files=3D0, f_ffr=
ee=3D0,
f_fsid=3D{val=3D[0, 0]}, f_namelen=3D255, f_frsize=3D4096,
f_flags=3DST_VALID|ST_NOSUID|ST_NODEV|ST_NOEXEC|ST_RELATIME}) =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_MATCH, 0x7fdac3db68, [30]) =3D
-1 ENOENT (No such file or directory)
close(3)                                =3D 0
socket(AF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_MATCH, 0x7fdac3db68, [30]) =3D
-1 ENOENT (No such file or directory)
close(3)                                =3D 0
write(2, "iptables v1.8.7 (legacy): ", 26iptables v1.8.7 (legacy): ) =3D 26
write(2, "Couldn't load match `owner':No s"..., 54Couldn't load match
`owner':No such file or directory
) =3D 54
write(2, "\n", 1
)                       =3D 1
write(2, "Try `iptables -h' or 'iptables -"..., 61Try `iptables -h' or
'iptables --help' for more information.
) =3D 61
exit_group(2)                           =3D ?
+++ exited with 2 +++

Looks like we're missing /usr/lib/xtables/libipt_owner.so?
https://forums.gentoo.org/viewtopic-t-754259-start-0.html suggests
this requires CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm so I tried rebuilding
the kernel with that:
# iptables -A OUTPUT -m owner --uid 0
No error returned.

But /usr/lib/xtables/libipt_owner.so is still missing. If I run the
working version with strace the difference seems to be getsockopt,
from:
newfstatat(AT_FDCWD, "/proc/net/ip_tables_names",
{st_mode=3DS_IFREG|0440, st_size=3D0, ...}, AT_SYMLINK_NOFOLLOW) =3D 0
statfs("/proc/net/ip_tables_names", {f_type=3DPROC_SUPER_MAGIC,
f_bsize=3D4096, f_blocks=3D0, f_bfree=3D0, f_bavail=3D0, f_files=3D0, f_ffr=
ee=3D0,
f_fsid=3D{val=3D[0, 0]}, f_namelen=3D255, f_frsize=3D4096,
f_flags=3DST_VALID|ST_NOSUID|ST_NODEV|ST_NOEXEC|ST_RELATIME}) =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_MATCH, 0x7fdac3db68, [30]) =3D
-1 ENOENT (No such file or directory)

to:
newfstatat(AT_FDCWD, "/proc/net/ip_tables_names",
{st_mode=3DS_IFREG|0440, st_size=3D0, ...}, AT_SYMLINK_NOFOLLOW) =3D 0
statfs("/proc/net/ip_tables_names", {f_type=3DPROC_SUPER_MAGIC,
f_bsize=3D4096, f_blocks=3D0, f_bfree=3D0, f_bavail=3D0, f_files=3D0, f_ffr=
ee=3D0,
f_fsid=3D{val=3D[0, 0]}, f_namelen=3D255, f_frsize=3D4096,
f_flags=3DST_VALID|ST_NOSUID|ST_NODEV|ST_NOEXEC|ST_RELATIME}) =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_MATCH,
"owner\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1", [30]) =3D 0

I don't understand why getsockopt() doesn't show the string in the
first instance, makes diagnosing the problem difficult.

The full command still fails:
# strace iptables -w -t nat -I PREROUTING -s 192.168.12.0/24 -d
192.168.12.1 -p tcp -m tcp --dport 53 -j REDIRECT --to-ports 5353
execve("/usr/sbin/iptables", ["iptables", "-w", "-t", "nat", "-I",
"PREROUTING", "-s", "192.168.12.0/24", "-d", "192.168.12.1", "-p",
"tcp", "-m", "tcp", "--dport", "53", "-j", "REDIRECT", "--to-ports",
"5353"], 0x7ff90c7de8 /* 29 vars */) =3D 0
brk(NULL)                               =3D 0x55b6039000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fb4e97000
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) =3D -1 ENOENT (No such
file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D32961, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 32961, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x7fb4e8e000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libip4tc.so.2", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D31152, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 160296, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4e=
39000
mmap(0x7fb4e40000, 94760, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4e40000
munmap(0x7fb4e39000, 28672)             =3D 0
munmap(0x7fb4e58000, 33320)             =3D 0
mprotect(0x7fb4e47000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4e56000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) =3D 0x7fb4e56000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libip6tc.so.2", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D31152, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 160296, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4e=
18000
mmap(0x7fb4e20000, 94760, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4e20000
munmap(0x7fb4e18000, 32768)             =3D 0
munmap(0x7fb4e38000, 29224)             =3D 0
mprotect(0x7fb4e27000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4e36000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) =3D 0x7fb4e36000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/libxtables.so.12", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D59304, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 199720, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4d=
ef000
mmap(0x7fb4df0000, 134184, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4df0000
munmap(0x7fb4def000, 4096)              =3D 0
munmap(0x7fb4e11000, 60456)             =3D 0
mprotect(0x7fb4dfe000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4e0d000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) =3D 0x7fb4e0d000
mmap(0x7fb4e0f000, 7208, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4e0f000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\264\2\0\0\0\0\0=
"...,
832) =3D 832
pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0/\267c\324\361R\25\177\n\177\26\3=
27\322\277\4\211"...,
68, 768) =3D 68
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D1630088, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 1805328, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4=
c37000
mmap(0x7fb4c40000, 1739792, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4c40000
munmap(0x7fb4c37000, 36864)             =3D 0
munmap(0x7fb4de9000, 27664)             =3D 0
mprotect(0x7fb4dc8000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4dd7000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x187000) =3D 0x7fb4dd7000
mmap(0x7fb4ddd000, 48144, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4ddd000
close(3)                                =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fb4e8c000
set_tid_address(0x7fb4e8c0f0)           =3D 83953
set_robust_list(0x7fb4e8c100, 24)       =3D 0
rseq(0x7fb4e8c7c0, 0x20, 0, 0xd428bc00) =3D 0
mprotect(0x7fb4dd7000, 12288, PROT_READ) =3D 0
mprotect(0x7fb4e0d000, 4096, PROT_READ) =3D 0
mprotect(0x7fb4e36000, 4096, PROT_READ) =3D 0
mprotect(0x7fb4e56000, 4096, PROT_READ) =3D 0
mprotect(0x558371f000, 4096, PROT_READ) =3D 0
mprotect(0x7fb4e9b000, 8192, PROT_READ) =3D 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024,
rlim_max=3DRLIM64_INFINITY}) =3D 0
munmap(0x7fb4e8e000, 32961)             =3D 0
getrandom("\xfa\xf8\xa1\x00\x5e\xc6\xd6\x38", 8, GRND_NONBLOCK) =3D 8
brk(NULL)                               =3D 0x55b6039000
brk(0x55b605a000)                       =3D 0x55b605a000
newfstatat(AT_FDCWD, "/etc/nsswitch.conf", {st_mode=3DS_IFREG|0644,
st_size=3D482, ...}, 0) =3D 0
newfstatat(AT_FDCWD, "/", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}, 0)=
 =3D 0
openat(AT_FDCWD, "/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) =3D 3
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D482, ...}, AT_EMPTY_PA=
TH) =3D 0
read(3, "# /etc/nsswitch.conf\n#\n# Example"..., 4096) =3D 482
read(3, "", 4096)                       =3D 0
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D482, ...}, AT_EMPTY_PA=
TH) =3D 0
close(3)                                =3D 0
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D32961, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 32961, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x7fb4e8e000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib/tls/aarch64/libnss_db.so.2",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib/tls/aarch64", 0x7fe4e67730, 0) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib/tls/libnss_db.so.2", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib/tls", 0x7fe4e67730, 0) =3D -1 ENOENT (No such
file or directory)
openat(AT_FDCWD, "/lib/aarch64/libnss_db.so.2", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib/aarch64", 0x7fe4e67730, 0) =3D -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib/libnss_db.so.2", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...},=
 0) =3D 0
openat(AT_FDCWD, "/usr/lib/tls/aarch64/libnss_db.so.2",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib/tls/aarch64", 0x7fe4e67730, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/lib/tls/libnss_db.so.2", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib/tls", 0x7fe4e67730, 0) =3D -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/usr/lib/aarch64/libnss_db.so.2",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib/aarch64", 0x7fe4e67730, 0) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/usr/lib/libnss_db.so.2", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib", {st_mode=3DS_IFDIR|0755, st_size=3D32768,
...}, 0) =3D 0
munmap(0x7fb4e8e000, 32961)             =3D 0
openat(AT_FDCWD, "/etc/protocols", O_RDONLY|O_CLOEXEC) =3D 3
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D2932, ...}, AT_EMPTY_P=
ATH) =3D 0
lseek(3, 0, SEEK_SET)                   =3D 0
read(3, "# Internet (IP) protocols\n#\n# Up"..., 4096) =3D 2932
close(3)                                =3D 0
newfstatat(AT_FDCWD, "/usr/lib/xtables/libipt_tcp.so", 0x7fe4e68508,
0) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/lib/xtables/libxt_tcp.so",
{st_mode=3DS_IFREG|0755, st_size=3D14424, ...}, 0) =3D 0
openat(AT_FDCWD, "/usr/lib/xtables/libxt_tcp.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D14424, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 143568, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4c=
1c000
mmap(0x7fb4c20000, 78032, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4c20000
munmap(0x7fb4c1c000, 16384)             =3D 0
munmap(0x7fb4c34000, 45264)             =3D 0
mprotect(0x7fb4c23000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4c32000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7fb4c32000
close(3)                                =3D 0
mprotect(0x7fb4c32000, 4096, PROT_READ) =3D 0
socket(AF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
newfstatat(AT_FDCWD, "/proc/net/ip_tables_names",
{st_mode=3DS_IFREG|0440, st_size=3D0, ...}, AT_SYMLINK_NOFOLLOW) =3D 0
statfs("/proc/net/ip_tables_names", {f_type=3DPROC_SUPER_MAGIC,
f_bsize=3D4096, f_blocks=3D0, f_bfree=3D0, f_bavail=3D0, f_files=3D0, f_ffr=
ee=3D0,
f_fsid=3D{val=3D[0, 0]}, f_namelen=3D255, f_frsize=3D4096,
f_flags=3DST_VALID|ST_NOSUID|ST_NODEV|ST_NOEXEC|ST_RELATIME}) =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_MATCH,
"tcp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", [30]) =3D 0
close(3)                                =3D 0
newfstatat(AT_FDCWD, "/usr/lib/xtables/libipt_REDIRECT.so",
{st_mode=3DS_IFREG|0755, st_size=3D10344, ...}, 0) =3D 0
openat(AT_FDCWD, "/usr/lib/xtables/libipt_REDIRECT.so", O_RDONLY|O_CLOEXEC)=
 =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0\0\0\0\0\0\0\0"=
...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D10344, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 139480, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7fb4b=
fd000
mmap(0x7fb4c00000, 73944, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7fb4c00000
munmap(0x7fb4bfd000, 12288)             =3D 0
munmap(0x7fb4c13000, 49368)             =3D 0
mprotect(0x7fb4c02000, 61440, PROT_NONE) =3D 0
mmap(0x7fb4c11000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7fb4c11000
close(3)                                =3D 0
mprotect(0x7fb4c11000, 4096, PROT_READ) =3D 0
socket(AF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
getsockopt(3, SOL_IP, IPT_SO_GET_REVISION_TARGET, 0x7fe4e683e8, [30])
=3D -1 ENOENT (No such file or directory)
close(3)                                =3D 0
write(2, "iptables v1.8.7 (legacy): ", 26iptables v1.8.7 (legacy): ) =3D 26
write(2, "unknown option \"--to-ports\"", 27unknown option "--to-ports") =
=3D 27
write(2, "\n", 1
)                       =3D 1
write(2, "Try `iptables -h' or 'iptables -"..., 61Try `iptables -h' or
'iptables --help' for more information.
) =3D 61
exit_group(2)                           =3D ?
+++ exited with 2 +++

Previously we had a failure with IPT_SO_GET_REVISION_MATCH, now it's
IPT_SO_GET_REVISION_TARGET. I looked for usage of this in the Linux
source for v5.4.238:
https://elixir.bootlin.com/linux/v5.4.238/C/ident/IPT_SO_GET_REVISION_TARGE=
T
They're used in the same function.
I also noticed that if you run without --to-ports you get:
# iptables -w -t nat -I PREROUTING -s 192.168.12.0/24 -d 192.168.12.1
-p tcp -m tcp --dport 53 -j REDIRECT
iptables v1.8.7 (legacy): Couldn't load target `REDIRECT':No such file
or directory

So if adding CONFIG_NETFILTER_XT_MATCH_OWNER fixed
IPT_SO_GET_REVISION_MATCH, would adding
CONFIG_NETFILTER_XT_TARGET_REDIRECT fix IPT_SO_GET_REVISION_TARGET?

Yes it does, NAT method now works.


On Mon, 29 Jul 2024 at 04:58, Reindl Harald <h.reindl@thelounge.net> wrote:
>
>
>
> Am 25.07.24 um 04:29 schrieb Tom Isaacson:
> > I don't have strace on the device, it's pretty minimal. But
> > libxt_owner.so is present here:
> > /usr/lib/xtables/libxt_owner.so
> > along with all the other files.
> >
> > The installation is from Yocto:
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__layers.openembed=
ded.org_layerindex_recipe_300425_&d=3DDwICaQ&c=3Dq3cDpHe1hF8lXU5EFjNM_C93KO=
mcBXCBnhee2v6PYlc&r=3DMO7EWU3DamJNNM8h6vHmeK6CEry2ufcorA3OreLf9oSJJvfzyukEH=
rKjEuU65HDv&m=3Dqra8kepdXvk2kSHd5pZNDgZwemrhMGNw-eOtKfUoleBSvjSCrB1FYvyXb5a=
XbklA&s=3DnDKMvy2KD4qfYfMInybCHSfKn1_vI_KQd3Re6Bp8lxA&e=3D
>
> so why don't you ask them what they have done to cripple down the
> binary? upstream is innocent
>
> > On Thu, 25 Jul 2024 at 14:19, Florian Westphal <fw@strlen.de> wrote:
> >>
> >> Tom Isaacson <thomas.isaacson@motorolasolutions.com> wrote:
> >>>>      Sharing Internet using method: nat
> >>>>      iptables v1.8.7 (legacy): unknown option "--to-ports"
> >>>>      Try `iptables -h' or 'iptables --help' for more information.
> >>>>      Doing cleanup.. done
> >>
> >> Broken iptables installation.
> >>
> >>>> The offending iptables commands are:
> >>>>              iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 =
-d
> >>>> ${GATEWAY} \
> >>>>                  -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DN=
S_PORT
> >>>>              iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 =
-d
> >>>> ${GATEWAY} \
> >>>>                  -p udp -m udp --dport 53 -j REDIRECT --to-ports $DN=
S_PORT
> >>>>
> >>>> I searched around for a solution and found
> >>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__community.uni=
x.com_t_iptables-2Dv1-2D8-2D7-2Dnf-2Dtables-2Dunknown-2Doption-2Dto-2Dports=
_385377_3&d=3DDwIBAg&c=3Dq3cDpHe1hF8lXU5EFjNM_C93KOmcBXCBnhee2v6PYlc&r=3DMO=
7EWU3DamJNNM8h6vHmeK6CEry2ufcorA3OreLf9oSJJvfzyukEHrKjEuU65HDv&m=3D3pEifEeI=
BaWYzhy_9MSuLYFwj7s1hDnpv2ftIP8xg0VZA5QWqX6RKTC79F1ylozp&s=3DsBy-V0FVFtnFXy=
vzNpVWO6IaPMyAYTyauL9S5RRjQrk&e=3D
> >>
> >> This has all diagnostic commands that you'll need to figure out whats
> >> happening.
> >>
> >>>> but this command also fails:
> >>>>      # iptables -A OUTPUT -m owner --uid 0
> >>>>      iptables v1.8.7 (legacy): Couldn't load match `owner':No such f=
ile
> >>>> or directory
> >>>>
> >>>> iptables links to xtables-legacy-multi but it seems to have all of t=
he
> >>>> necessary files present.
> >>
> >> iptables says it can't load match 'owner' (libxt_owner.so).
> >>
> >> So its either missing or iptables is searching the wrong location.
> >>
> >> strace should tell which directory iptables is searching to fetch
> >> extensions.
> >>
> >> Some embedded distros split packages into subpackages to save space,
> >> so it might be missing package too.

--=20


*For more information on how and why we collect your personal=20
information, please visit our Privacy Policy=20
<https://www.motorolasolutions.com/en_us/about/privacy-policy.html?elqTrack=
Id=3D8980d888905940e39a2613a7a3dcb0a7&elqaid=3D2786&elqat=3D2#privacystatem=
ent>.*
