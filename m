From: "Thibault Le Meur" <Thibault.Lemeur@supelec.fr>
Subject: iptable 1.2.11 and kernel 2.6.11-1 compatibility issue
Date: Wed, 1 Jun 2005 17:05:44 +0200
Message-ID: <003801c566bb$62a1de20$7c66e4a0@supelec.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've got a strange behaviour on a Linux Fedora system with:
* kernel : kernel-2.6.11-1.27_FC3
* iptables: iptables-1.2.11-3.1.FC3

On with this kernel the iptables rules on the loopback interface _must_be_
changed from:
iptables -A INPUT  -i lo  -m state --state NEW  -j ACCEPT
iptables -A OUTPUT  -o lo  -m state --state NEW  -j ACCEPT
To:
iptables -A INPUT  -i lo   -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
iptables -A OUTPUT  -o lo   -s 127.0.0.1 -d 127.0.0.1  -j ACCEPT

Otherwise some trafic on the loopback interface is dropped:
* for instance a simple ssh localhost results in the following log
Jun  1 17:01:52 crikitu kernel: RULE 4 -- DENY IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
LEN=75 TOS=0x00 PREC=0x00 TTL=64 ID=54315 DF PROTO=TCP SPT=22 DPT=33769
WINDOW=8192 RES=0x00 ACK PSH URGP=0

Note that this modification wasn't necessary with my old kernel
(kernel-2.6.11-1.14_FC3).

A bug is already opened on the Fedora's bugzilla
(https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=158710) but I'd like
to know if anyone here has an idea of what is occurring.
Is it a known issue? If this is not the best list to ask for this, is there
a better list to get support from?

Thank you in advance.
Thibault.



