From: netfilter@buglecreek.com
Subject: Drop Input Policy
Date: Tue, 14 Feb 2006 12:02:10 -0700
Message-ID: <1139943730.29158.254367263@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter_list <netfilter@lists.netfilter.org>

If the default INPUT chain policy is set to drop is there any reason to
explicitly add rules to drop packets within the firewall script?  I am
reading various firewall books and it is recommended that you set the
default INPUT chain to drop. After this is done, they go on to construct
a firewall to drop all sorts on packets on the INPUT chain.  I am
somewhat confused why these rules are needed when your default is to
drop.  Can you simply just add accept rules?  Is the default drop policy
a  safety net and it is good practice to explicitly drop packets within
your script?

Thanks    

