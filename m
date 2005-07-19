From: "Jannic S. Jensen" <info@jannic.dk>
Subject: Lacking support for icmp : "--icmp-type"
Date: Tue, 19 Jul 2005 22:31:54 +0200
Message-ID: <6D811849-6963-4B65-A647-1FCF25A6E07B@jannic.dk>
Mime-Version: 1.0 (Apple Message framework v733)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hi list

I'am having some troubles getting iptables working with icmp support.  
The following:

---
root@fw  ~# iptables -N AllowICMPs
root@fw  ~# iptables -A AllowICMPs -p icmp --icmp-type fragmentation- 
needed -j ACCEPT
---

Results in:

---
root@fw ~# iptables -N AllowICMPs
root@fw ~# iptables -A AllowICMPs -p icmp --icmp-type fragmentation- 
needed -j ACCEPT
iptables v1.3.2: Unknown arg `--icmp-type'
Try `iptables -h' or 'iptables --help' for more information.
---

Iptables are running on the Trustix 3.0 distribution using Shorewall  
firewall.  I've tried compiling iptables from source and using the  
rpm from Trustix. RPM is version 1.3.1 of iptables and source is  
latest - 1.3.2. The kernel is 2.6.12 from Trustix.

I've been trying both Shorewall mailinglist and Trustix mailinglist  
but no success yet :(. It seems like there is no support for icmp in  
iptables.

---
iptables -p icmp --help
---

Gives no indication of icmp support. libipt_icmp.so is installed on  
the system though.

Any hints? Thanks.

Best regards
/Jannic

