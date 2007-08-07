From: Alexander Fortin <alieno@it.net.au>
Subject: ip_conntrack growing indefinitely
Date: Tue, 07 Aug 2007 11:02:11 +0800
Message-ID: <46B7E0B3.4060202@it.net.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi everybody. We're running a couple of Debian Sarge machines with 
2.4.31 kernel doing NAT for our network.
Recently we had troubles with lost packets because of full ip_conntrack 
buffers, and it's strange because usually the average number of 
connections is not more then 8000-10000.
For now it has been patched setting ip_conntrack_max to 65536 but 
connections still grow indefinitely (seems NAT never drops old connections).
Any idea of the reasons? Could be related with the kernel version (2 
years old) we're running?

Thanks

-- 
Alexander Fortin
IT Consultant
Informed Technology
E-mail: alieno@it.net.au
Ph: 08 9460 4888  Fax: 08 9460 4877

