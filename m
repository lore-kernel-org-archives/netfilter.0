From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: problems building conntrack w/ uclibc - no output
Date: Tue, 28 Nov 2006 03:36:40 +0100
Message-ID: <456BA0B8.3050607@netfilter.org>
References: <200611221144.00766.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611221144.00766.alan.ezust@presinet.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Alan Ezust <alan.ezust@presinet.com>
Cc: netfilter@lists.netfilter.org

Alan Ezust wrote:
> using libnetfilter_conntrack-0.0.31, libnfnetlink (SVN) and 
> conntrack 1.00beta2. 
> 
> Hi Folks, I was just wondering, if I'm the only one in this boat. 
> 
> I'm trying to build conntrack for a box that runs uclibc, so I am using a 
> scratchbox to build (i386-gcc-3.3.2-uclibc-0.9.26), and I've managed to build 
> and insteall each of the three libraries, and they can run without any linker 
> errors, but when I am running it on the embedded box, in -e mode, 
> I see no output - when I strace, I see this in the output:
> 
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000002}, 
> msg_iov(1)=[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 188
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000002}, 
> msg_iov(1)=[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 188
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000002}, 
> msg_iov(1)=[{"\274\0\0\0\0\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 188
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
> msg_iov(1)=[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 164
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
> msg_iov(1)=[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 164
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
> msg_iov(1)=[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 164
> recvmsg(3, {msg_name(12)={sa_family=AF_NETLINK, pid=0, groups=00000004}, 
> msg_iov(1)=[{"\244\0\0\0\2\1\0\0\0\0\0\0\0\0\0\0\2\0\0\0004\0\1\200\24"..., 
> 8192}], msg_controllen=0, msg_flags=0}, 0) = 164
> 
> So it seems conntrack is receiving messages but not printing them out 
> properly. Has anyone else seen this problem? This is a hard problem to search 
> for, since there are no error messages.
> 
> Any advice? 

Strange. Unfortunately I don't have access to such environment so I
would require a considerable amount of time to set it up and I'm
currently totally burden in many things. Could you run conntrack inside
gdb and try to figure out what it wrong?

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

