From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: table traversal
Date: Fri, 28 Feb 2003 08:09:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <168d4128a3.128a3168d4@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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
To: netfilter@lists.netfilter.org

I have a question about table traversal.

Suppose I have two chains, in this order in a table.

iptables -A FORWARD -s 10.1.2.3 -j ACCEPT
iptables -A FORWARD -s 10.1.2.0/255.255.255.0 -j DROP

Under this scenario a packet from 10.1.2.3 would fall under both rules.
But would the packets be dropped or allowed to go through? Once it has
found a match for a packet will it traverse the rest of the table or
simply pass to the next one?

Will





 E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.



