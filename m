From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: max size of ipt_recent match
Date: Fri, 04 Nov 2005 11:03:05 +0100
Message-ID: <436B31D9.8080504@mnemon.de>
References: <436B214C.40205@asiaa.sinica.edu.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436B214C.40205@asiaa.sinica.edu.tw>
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
To: netfilter@lists.netfilter.org

Joshua, C.S. Chen schrieb:
> Hi folks,
> I am now using recent match to block ssh brute-force attack like
> 
> 
> 
> ### ssh brute-force attack rule
> $IPTABLES -A INPUT -p tcp --syn --dport 22 -m recent --name sshattack --set
> 
> $IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
> --rcheck --seconds 5 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: 3/5 '
> $IPTABLES -A INPUT -p tcp --dport 22 --syn -m recent --name sshattack \
> --rcheck --seconds 5 --hitcount 3 -j REJECT --reject-with tcp-reset
> 
> 
> 
> 
> 
> 
> $IPTABLES -A FORWARD -p tcp --syn --dport 22 -m recent --name sshattack
> --set
> 
> 
> $IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
> --rcheck --seconds 5 --hitcount 3 -j LOG --log-prefix 'SSH REJECT: 3/5 '
> $IPTABLES -A FORWARD -p tcp --dport 22 --syn -m recent --name sshattack \
> --rcheck --seconds 5 --hitcount 3 -j REJECT --reject-with tcp-reset
> 
> 
> It works very well for me.
> Then I found that, the internal table at /proc/net/ipt_recent/sshattack
> has a max limit of 100 entries, after the max number of entry has been
> reached, no more new entry can be added so the above will have no effect.
> 
> Any knows how to 'enlarge' the limit of the table? or what should be
> done to cycle/purge old entries so new hit entries can be added.

man iptables

recent

  [SNIP]

  The module itself accepts parameters, defaults shown:

       ip_list_tot=100
              Number of addresses remembered per table

       ip_pkt_list_tot=20
              Number of packets per address remembered

       ip_list_hash_size=0
              Hash table size. 0 means to calculate it
              based on ip_list_tot, default: 512

       ip_list_perms=0644
              Permissions for /proc/net/ipt_recent/* files

       debug=0
              Set to 1 to get lots of debugging info

Some time ago there was a posting, that this doesn't work. So
alternatively, you can modify the source code and edit the respective
var (<Path/to/kernel_source>/net/ipv4/netfilter/ipt_recent.c => static
int ip_list_tot=100).

Have a nice time,

Joerg

