From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: Filtering on MAC Addresses
Date: Fri, 04 Feb 2005 13:58:21 +0000
Message-ID: <42037F7D.2070804@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am trying to filter on MAC addresses and have alittle problem.

I use a rule like the following

/sbin/iptables -A MACALLOW -p ALL -i eth0 -m mac --mac-source 
'MACADDRESS' -j ACCEPT

Where MACADDRESS is replaced by the MAC CODE of the machine.

However, the MAC address that the Network card uses is not being used by 
IPTables. It tries to use a larger MAC Code, which appears to be two mac 
addresses pinned together.

So if I use the MAC code of 00:10:5a:14:50:db, it gets rejected because 
IPTables uses the MAC Code of 00:09:5b:1b:52:77:00:10:5a:14:50:db:08:00
Which does not match obviously. So why is IPTables using this, and how 
can I get round it to use IPTables MAC Code rules?

Many Thanks for any help you can offer


Mike.







