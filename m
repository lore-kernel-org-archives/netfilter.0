From: Brett Curtis <dashnu@gmail.com>
Subject: DNAT Question & ULOG Question
Date: Tue, 13 Jun 2006 10:50:39 -0400
Message-ID: <EB7DBACA-57BF-4FB5-9C71-03AA7D6C2C54@gmail.com>
Mime-Version: 1.0 (Apple Message framework v750)
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
To: Netfilter Lists <netfilter@lists.netfilter.org>

A couple questions before I try to push out my new firewall.

Creating a  PREROUTING rule on a DROP all policy like so.

$IPT -t nat -A PREROUTING -i $EXTIF -d $HOST_EXTIP -p tcp --dport 22 \
   -j DNAT --to-destination $HOST_INTIP:22

This allows the packets to pass through my external nic so I would  
only need a forward rule like so to complete the request?

$IPT -A FORWARD  -o $INTIF -d $HOST_INTIP -p tcp --dport 22

 From what I read the routing decision happens after PREROUTING but I  
am not sure if the request has traversed pass my external interface  
at this time.
Not sure if I need to specify both interface or in my case it would  
be the same if I specified none.


My question related to ULOG....  Is ULOG the only way to get iptables  
logging out of my dmesg ? Every time I type dmesg I find it  
overloaded with iptables logging.

Thanks.



