From: Dave Cattermole <dmc@mrc-lmb.cam.ac.uk>
Subject: logging port numbers
Date: Fri, 9 May 2003 07:58:09 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0305090728350.11501-100000@pc1032-2.mrc-lmb.cam.ac.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a NAT box running and I would like to be able to log all the actual 
port numbers used.  From /proc/net/ip_conntrack I can see the original 
ipaddress and port number aswell as the port number and ipaddress that the 
reply is directed to but this is not included in the messages I get from 
the iptables LOG facility which only displays the address and port number 
prior to the SNAT operation.

THis is how I do my logging

/sbin/iptables -I FORWARD -m state --state NEW -j LOG

Are there any options I can change to get all the port numbers logged 
before and after NAT?

--
Dave


