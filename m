From: "Mark Hendrickson" <mhendric@cisco.com>
Subject: Question regarding the interaction of iptables and IPsec
Date: Wed, 16 Mar 2005 14:27:53 -0700
Message-ID: <200503162127.BCY40584@mira-sjc5-b.cisco.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

All,
 
This is my first time posting to this list, so if the question has already
been answered. Please point me to the information.
 
Question:  After an ESP packet has been unencrypted and restored to its
original form by IPsec, racoon for our installation, is the restored packet
ran back through iptable again for filtering??
 
Thanks,
Mark
