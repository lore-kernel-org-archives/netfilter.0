From: netfilter@tommi.org
Subject: ICMP and state/conntrack
Date: Fri, 28 Feb 2003 10:37:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030228103743.GA31779@ok.is>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello

I'm wondering if state doesn't apply to ICMP packets.

iptables -A FORWARD -p icmp -m state -d 1.2.3.4 --state NEW -j ACCEPT
iptables -A FORWARD -m state --state NEW,INVALID -j REJECT

if I ping 1.2.3.4 the echo-reply is blocked from 1.2.3.4. Is this normal, I
thought that the echo-reply should be marked RELATED and therefore not
blocked?


====
Tomas Edwardsson
HP Technical Support      \  HP Certified System Administrator
Red Hat Technical Support  \  Red Hat Certified Engineer.
Opin Kerfi


