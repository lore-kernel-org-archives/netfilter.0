From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: iptables crashes server?
Date: Mon, 04 Apr 2005 10:16:32 +0200
Message-ID: <4250F7E0.3070203@uplink-verein.ch>
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

hi all

i'm running linux 2.6.11.3 and iptables 1.3.1 with pom 20050321. i patched the kernel with ipp2p, 
and layer-7 patch.

the server is running as a bridge and is working absolutly fine. after a while (there is no specific 
time limit) the server crashes. the server is no more able to allocate new memory and even swapping 
doesn't help. in this state i am unable to log in, i have to push the power button.

i don't see heavy traffic before a crash and i don't see any flooding. is there a known memory leak 
problem?

i checked /proc/sys/net/ipv4/netfilter/ip_conntrack_count this number is in the range of 2'000 - 5'000.
i checked /proc/slabinfo <active_objs> is more or less similiar to ip_conntrack_count, <num_objs> is 
the maximum of ip_contrack_count.
i also was checking /proc/meminfo and there was no steady increase.

/var/log/messages shows no warning.
/var/log/syslog shows nothing
icmp is working.
imap is probably working (someone told me).
http is not working.
pop over ssl is working (sometimes).

does anyone had/have the same experience? or does anyone have some hints for further steps?

hardware: dell poweredge 2560 with 2gybte ram, 2 xenon dual cpus.

i was running the same setup wiht an older kernel 2.6.7/10 without much troubles.

regards
moritz



