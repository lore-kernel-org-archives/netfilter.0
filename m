From: ads nat <adsnat@yahoo.com>
Subject: Problem of Setting dafault polocies to 'DROP'
Date: Wed, 24 Dec 2003 03:03:24 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031224110324.15253.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I have created IPTABLES rules from command prompt.
Save and Restore them with iptables-save and
iptables-restore command.
Hi,
As advised in some of the tutorials, I tried to set
IPTABLES rules first 'FLUSH' and then tried to set
default policies of INPUT, OUTPUT and FORWARD to DROP
as follows :

###############

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

################

from command prompt.

The moment I set "iptables -P INPUT DROP"
System hangs.

Tutorial says, first set all default policies to DROP
and then setup rules to ACCEPT.

Please tell me How it can be achieved.
Thanks for support.




__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

