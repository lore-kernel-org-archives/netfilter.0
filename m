From: Craig Davison <cd@securityfocus.com>
Subject: Re: Link time problems with libipq example code
Date: Fri, 20 Dec 2002 16:01:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021220230138.GA7030@securityfocus.com>
References: <20021220224405.GB28191@securityfocus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021220224405.GB28191@securityfocus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Here's the output from nm:
nm /usr/local/lib/libipq.a

libipq.o:
         U bind
         U close
         U __errno_location
         U fprintf
         U fputc
         U fputs
         U free
         U fwrite
         U getpid
00000224 T ipq_create_handle
000004a4 T ipq_ctl
00000334 T ipq_destroy_handle
00000000 D ipq_errmap
00000088 d ipq_errno
000004b0 T ipq_errstr
000003c4 T ipq_get_msgerr
000003d4 T ipq_get_packet
000003b8 T ipq_message_type
00000060 t ipq_netlink_recvfrom
00000034 t ipq_netlink_sendmsg
00000000 t ipq_netlink_sendto
000004c4 T ipq_perror
000003ac T ipq_read
0000035c T ipq_set_mode
000003e0 T ipq_set_verdict
00000208 t ipq_strerror
         U malloc
         U recvfrom
         U select
         U sendmsg
         U sendto
         U socket
         U stderr
         U strerror

On Fri, Dec 20, 2002 at 03:44:05PM -0700, Craig Davison wrote:
> I've been trying to compile the libipq example code in the libipq man page.

-- 
Craig Davison
Symantec Corporation
+1 (403) 213-3939 ext. 228

