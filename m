From: <tbsky@greenware.com.tw>
Subject: how to leave mangle table?
Date: Thu, 13 Jun 2002 19:44:42 +0800 (CST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1618.172.16.10.1.1023968682.squirrel@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

hi:
  i try to set some rules at mangle table.
  if rule 1 match, rule2 seems still be checked.
  can i leave mangle table if rule 1 match?
  eg: if rule 1 match, then rest of rules are not checked,
      just like filter table..
  do i need to create a new chain to do this?

example:
rule1: iptables -t mangle -A PREROUTING -s 10.1.1.2 -j MARK --set-mark 1
rule2: iptables -t mangle -A PREROUTING -s 10.1.1.0/24 -j MARK --set-mark 2

Regards,
tbsky



