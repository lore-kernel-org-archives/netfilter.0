From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: hi..
Date: Mon, 09 Dec 2002 16:16:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF47485.6040709@inbox.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NETFILTER <netfilter@lists.netfilter.org>

hi all,

just a thought....
i want to know if the -N  flag is avaiable for PREROUTING/POSTROUTING 
mangle/nat etc ?
i know the below is possible ...
iptables -N myTable
iptables -A INPUT -s <ip> -j myTable

but if want to do this-->>
iptables -A POSTROUTING -t nat -s <> -j myTableTwo
or
iptables -A PRETROUTING -t mangle -s <> -j myTableTwo
is it possible ?.. how do i create a new table for this ?

thanking in advance..
A.H


