From: "Praneeth Samineni" <praneeth_s@excite.com>
Subject: Outbound Connections fail.
Date: Mon, 14 Mar 2005 02:06:17 -0500 (EST)
Message-ID: <20050314070617.5F6DEB6F5@xprdmailfe19.nwk.excite.com>
Reply-To: praneeth_s@excite.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: netfilter@lists.netfilter.org

 Hi!I am using Iptables on a RH 30 2.4 Kernel for INPUT connections filtering, while allowing all OUTPUT.Inbound connections seems to work fine, but outbound connections fail. Connection status is SYN_SENT on the SOURCE side and SYN_RECV at the destination side, shows that ACK packets are getting filtered at INPUT chain. Does not IPTABLES allow the return packets of a connection initiated already thru IPTABLES? Are there any rules to enable this apart from manually allowing return packets on port basis everytime.Best WishesPraneeth Samineni

_______________________________________________
Join Excite! - http://www.excite.com
The most personalized portal on the Web!
