From: Sander Eikelenboom <S.Eikelenboom@stud.tue.nl>
Subject: How can Iget multiple outgoing VPN (pptp) connections with
	iptablesand snat?
Date: Fri, 8 Apr 2005 13:22:02 +0200
Message-ID: <1852402972.20050408132202@stud.tue.nl>
Reply-To: Sander Eikelenboom <S.Eikelenboom@stud.tue.nl>
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

The pom-ng pptp-conntrack-nat helper (and most other as far as i know)
don't apply to kernel 2.6.11.x (yet). With kernel 2.6.10 the
pptp-conntrack-nat patch should work fine!

I just use general iptables rules, to accept and forward related and
esthablised traffic. And load all four modules (or compile them in)



