From: "P. Harlow" <wolf-r1@wispertel.net>
Subject: IPTables not starting with Fedora 6
Date: Thu, 07 Dec 2006 17:51:31 -0700
Message-ID: <4578B713.8020406@wispertel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

This might be better posted to an SELinux list however I thought I'd 
start here.

I have a fresh install of Fedora Core 6. All works well with IPTables 
however when I try to get it started at boot I get the following SELinux 
error:

type=AVC msg=audit(1165530432.263:80): avc: denied { read } for pid=2995 
comm="iptables-restor" name="iptables" dev=dm-0 ino=11599885 
scontext=user_u:system_r:iptables_t:s0 
tcontext=user_u:object_r:etc_runtime_t:s0 tclass=file
type=SYSCALL msg=audit(1165530432.263:80): arch=40000003 syscall=5 
success=no exit=-13 a0=bffb4f67 a1=0 a2=1b6 a3=927e008 items=0 ppid=2986 
pid=2995 auid=501 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 
fsgid=0 tty=(none) comm="iptables-restor" exe="/sbin/iptables-restore" 
subj=user_u:system_r:iptables_t:s0 key=(null)

No matter what I do the machine refuses to read that file. Even if I 
re-create it manually. Has anyone run into this where iptables-restore 
is not allowed to read this file?

