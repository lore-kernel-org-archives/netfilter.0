From: "Olexandr O. Galay" <root@e-mail.te.ua>
Subject: ipt_connlimit trouble
Date: Sat, 31 Jan 2004 21:28:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <19730527125.20040131212831@e-mail.te.ua>
Reply-To: "Olexandr O. Galay" <root@e-mail.te.ua>
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

Hi everybody!

I have error trying to install ipt_connlimit module.
What i do:
1. download and unpack 2.4.24 to /usr/src/linux
2. download and unpack patch-o-matic-20031219
3. do ./runme base/connlimit.patch in pom directory (and received
patch applied answer)
4. compile and install kernel with all options of iptables sets to M (module)
5. download/compile/install iptables 1.2.9

so, now when i trying to # modprobe ipt_connlimit i get:
[root@test /]# modprobe ipt_connlimit
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o: unresolved symbol ip_conntrack_find_get
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o: insmod /lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o failed
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_connlimit.o: insmod ipt_connlimit failed

another modules loads and works success.

maybe anybody helps me?



