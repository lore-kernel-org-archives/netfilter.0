From: Earl A.Killian <netfilter@lists.killian.com>
Subject: iptables analyzer
Date: Wed, 22 Oct 2003 12:49:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16278.57173.146033.350478@teak.killian.com>
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

Has anyone built a iptables analyzer?  I am thinking writing one, but
I don't want to reinvent what might already exist.

I have in mind something that tries all "interesting" (as gleaned from
the rules themselves) combinations of IP addresses, protocols, ports,
etc., simulates the ruleset and says what happens.  The result would
be displayed in table form.

One could test the equivalence of two iptables specifications by
analyzing them and comparing the output (useful for seeing if an
"optmization" is correct).

