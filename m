From: Grant Adamson <gadamson@shaw.ca>
Subject: All interface specifications being replaced by ANYWHERE
Date: Fri, 09 Dec 2005 15:17:11 -0800
Message-ID: <001c01c5fd16$af0deb40$0201a8c0@shodan>
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

Hi All,

I recently redid my home gateway/NAT box with debian 3.1, and everything
looked to be working fine until I did a quick scan on it from outside to
test the firewall. All the services running appeared to be exposed. Checking
my rules with iptables -L, I found that for some reason, everywhere I had
specified a physical interface, it had been replaced by ANYWHERE.

For example, the following rule:

iptables -A INPUT -m state --state NEW -i ! $EXTIF -j ACCEPT

Ends up appearing in the iptables -L list as:

target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state NEW


Needless to say, this doesn't make for a very good situation. Has anyone
ever seen a problem like this before? Any suggestions would be greatly
appreciated.

Thanks,
Grant


