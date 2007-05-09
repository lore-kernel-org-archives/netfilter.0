From: "Ramsurrun Visham" <vishamr@gmail.com>
Subject: Problem with connection tracking in IPtables!!
Date: Wed, 9 May 2007 18:54:27 +0400
Message-ID: <802220ef0705090754q7b242fefvee61ea00ee58277e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=aU5/b2EoaLlqZezHHF/cuwgTUsjZfG5Z7Z/7gOZavH86ohFr7Pwqvle/nuvcyY+stFUftopP/cqtJLHa3RCj4Uac7XuqBTfgi7mGfmHjRKjOgUZaqTsTc6pwmpXRATnf96yOVFSS6xVC6PkgM4hPzb2RagZKU5gToOL9q9BB3LY=
Content-Disposition: inline
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

Hi to all,

I am using Fedora Core 5 with an upgraded kernel of 2.6.20.4. I
installed iptables-1.3.7 on it. However, I am not able to use
connection tracking. I checked all the items in Networking options
related to connection tracking and iptables. However, when I boot in
my 2.6.20.4 kernel, and issue the comand "service iptables start", I
get this:

[root@localhost ~]# service iptables start
Flushing firewall rules:                                   [  OK  ]
Setting chains to policy ACCEPT: raw mangle filter         [  OK  ]
Unloading iptables modules:                                [  OK  ]
Applying iptables firewall rules:                          [  OK  ]
Loading additional iptables modules: ip_conntrack_netbios_n[FAILED]

[root@localhost ~]# locate ip_conntrack_netbios
/lib/modules/2.6.15-1.2054_FC5smp/kernel/net/ipv4/netfilter/ip_conntrack_netbios_ns.ko
/usr/src/linux-2.6.20.4/net/ipv4/netfilter/ip_conntrack_netbios_ns.c
[root@localhost ~]#

It seems that connection tracking is not being activated. How can I
solve this problem?

Warm regards,
Visham

