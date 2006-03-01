From: "Sun Susan-SSUN2" <SSUN2@motorola.com>
Subject: Help - iptables: Invalid argument
Date: Wed, 1 Mar 2006 12:14:30 -0500
Message-ID: <274D46DDEB9F2244B2F1EA66B3FF54BC84BE29@de01exm70.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Dear Sir:

I'm new to network security and this is my first time to use iptables,
when I run a firewall script, I got the following error:

+ /sbin/iptables -A INPUT -m limit --limit 3/minute --limit-burst 3 -j
LOG --log-level DEBUG --log-prefix 'IPT INPUT packet died: '
iptables: Invalid argument

I also tried -m owner option, it give me same error:  "iptables: Invalid
argument".

But I don't get error for -m state. I can use iptables -L to see other
rules except the error commands.

I have the follow modules listed when I run lsmod:
ipt_owner               3976  0=20
ipt_MASQUERADE          4960  1=20
ipt_REJECT              8520  1=20
ipt_state               2688  4=20
ipt_limit               3488  0=20
ipt_LOG                 8288  0=20
iptable_nat            35162  2 ipt_MASQUERADE
iptable_mangle          5248  0=20
ip_conntrack           62332  3 ipt_MASQUERADE,ipt_state,iptable_nat
iptable_filter          4888  1=20
ip_tables              25088  9
ipt_owner,ipt_MASQUERADE,ipt_REJECT,ipt_state,ipt_limit,ipt_LOG,iptable_
nat,iptable_mangle,iptable_filter

Can anyone help me how to solve the error?

Thanks in advance,
Susan

