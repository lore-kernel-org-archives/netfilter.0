From: "Gautham Thavva" <gautham.thavva@lycos.com>
Subject: Access to Two management interfaces...
Date: Fri, 05 Dec 2003 10:08:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FEINGBGBBGOHDHAA@mailcity.com>
Reply-To: gautham.thavva@lycos.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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


I have eth0 as the management interface. This following rule helps me in accepting DHCP requests from the other interfaces(VLAN interfaces).

The default INPUT policy is DROP.
 
INET_IFACE="eth0"
#
# Special rule for DHCP requests
#

$IPTABLES -A INPUT -p UDP -i ! $INET_IFACE --dport 67 --sport 68 -j ACCEPT

Now, I have to support upto three other VLAN interfaces as management interfaces in addition to eth0.

Please can someone help me in creating a rule for granting access to other interfaces too.

Thanks,
Gautham



____________________________________________________________
Get advanced SPAM filtering on Webmail or POP Mail ... Get Lycos Mail!
http://login.mail.lycos.com/r/referral?aid=27005

