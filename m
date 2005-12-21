From: "Derick Anderson" <danderson@vikus.com>
Subject: ICMP types to allow
Date: Wed, 21 Dec 2005 08:45:04 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B710@mailbox.vikus.com>
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

I know that some networks just drop all ICMP to prevent traceroutes but
recently I've been been seeing problems related to fragementation and
MTU and wondering if dropping ICMP is causing some of that (since
Fragementation Needed packets can't get through). On the flip side of
that there's the Source Quench and Fragmentation Needed DoS attacks
which have recently become mildly popular (I've gotten a few hits on
Snort but not that many).=20

I'd like to hear from the list what ICMP types firewall admins are
allowing and why - what are the risks for allowing certain types vs. the
risks of NOT allowing them?

Thanks,

Derick Anderson

