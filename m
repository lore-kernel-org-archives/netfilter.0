From: Paladin <paladin@paladin.dhis.org>
Subject: iptables-save/restore masquerade bug
Date: Mon, 13 Jan 2003 20:43:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030113204307.0bde5ce6.paladin@paladin.dhis.org>
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

Hi all,

I'm using the version 1.2.6a of iptables. When doing a iptables-save
and having a rule "-j MASQUERADE --to 10000-11000", the rule is
saved without the "--to". As this been resolved in current version?
I didn't find any mention on it.

Thanks everyone,

---
Paladin

P.S. - Reply to me directly please.

