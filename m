From: "Magnus Westbergh" <magnus@comcon.se>
Subject: capture arp in hook and queue to userspace
Date: Wed, 25 Aug 2004 11:24:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <000201c48a85$59540ae0$0c02a8c0@Comcon2>
Reply-To: magnus@comcon.se
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I intend to capture all incoming packets (IP and ARP) and queue them for
userspace using the ip_queue module, and let my userspace application make
all verdicts. I have written a module using netfilter, and successfully
queued all IP-packets, but now I have no clue how to capture the ARP
packets, using this hook...

my_pre.hook        = my_in_hook;
my_pre.hooknum     = NF_IP_PRE_ROUTING;
my_pre.pf          = PF_INET;
my_pre.priority    = NF_IP_PRI_FIRST; 

unsigned int my_in_hook( unsigned int hooknum,
                         struct sk_buff **skb,
                         const struct net_device *in,
                         const struct net_device *out,
                         int ( *okfn ) ( struct sk_buff *) )


How does the ARP hook work? What do I have to change to capture all ARP
packets? Please show me an example
Thanks for helping me,

Sincerely Magnus



