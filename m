From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: ipt_connlimit trouble
Date: Sat, 31 Jan 2004 23:04:58 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDAECIFEAA.mark@npsl.co.uk>
References: <19730527125.20040131212831@e-mail.te.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <19730527125.20040131212831@e-mail.te.ua>
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
To: Netfilter List <netfilter@lists.netfilter.org>


> 4. compile and install kernel with all options of iptables sets
> to M (module)
Missing a reboot step here?

> so, now when i trying to # modprobe ipt_connlimit i get:
> [root@test /]# modprobe ipt_connlimit
> /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o:
> unresolved symbol ip_conntrack_find_get
Also try depmod -e -F /<path>/System.map and see if you still get the same
problem.


