From: "Chris M. Gamble" <chris.gamble@cpbinc.com>
Subject: Seeking assistance for broken LOG target after upgrade
Date: Thu, 22 Jan 2004 13:27:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9E0E7DA2130F1D42861EC43B568E99FC09165D@mail1.cpbinc.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I recently upgraded a redhat 7.3 base install to a new 2.4.24 kernel and =
upgraded the iptables to 1.2.9. Along with this, I implemented the pom =
base set to the kernel before installing.=20

Now, everything works better than ever, except when I try to use the LOG =
target.=20

When using the LOG target, I get the error that no such chain/target =
exists. Based on this, I tried to modprobe the ipt_LOG module, and =
attached is my error:

/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: unresolved =
symbol nf_log_unregister
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: unresolved =
symbol nf_log_register
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: insmod =
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o failed
/lib/modules/2.4.24/kernel/net/ipv4/netfilter/ipt_LOG.o: insmod ipt_LOG =
failed

Please help, I am at a complete loss what to do next.


