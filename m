From: "Louie Miranda" <louie@axishift.ath.cx>
Subject: Re: icmp echo requests
Date: Mon, 29 Sep 2003 14:55:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004d01c38656$9f663190$020119ac@admwebdevws>
References: <3F77CE17.30605@kdtc.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Yes, i believe thats correct.
I have this working example. Their are also some more reject examples, i
used to have a copy but i lost it. Try google for more icmp reject types.

-- snip from 72.creon, haha ----
$IPTABLES -A INPUT -p icmp --icmp-type 8 -d $MYIP -s 0/0 -j
REJECT --reject-with icmp-net-unreachable
-- snip from 72.creon, haha ----


-- -
Louie Miranda
http://www.axishift.com


----- Original Message -----
From: "cc" <cc@kdtc.net>
To: "Netfilter Group" <netfilter@lists.netfilter.org>
Sent: Monday, September 29, 2003 2:15 PM
Subject: icmp echo requests


