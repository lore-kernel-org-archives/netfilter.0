From: "Jee J.Z." <jz105@york.ac.uk>
Subject: whether there are any packets in the ip_queue
Date: Tue, 20 Apr 2004 01:16:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004a01c4266c$b2d7d830$68892090@grouse>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all,

I am using libipq for userspace programming on netfilter. I am having
problems to determine whether there are any packets in the ip_queue before I
call the function ipq_read(). I just don't wish to call ipq_read() when
there is no packet in the ip_queue, because I need my program to do other
things rather than waiting for a packet arriving (after calling ipq_read(),
the program will stop and wait for some time or until a packet coming from
the kernel). Are there anybody on the list who has any idea about this?

BTW, may I ask whether this is the proper list to ask about netfilter/libipq
programming, since it seems few people on the list talking about this kind
of questions?


