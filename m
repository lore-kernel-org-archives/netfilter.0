From: "Mark Goldberg" <goldber@globalcrossing.net>
Subject: More H.323 questions
Date: Mon, 01 Sep 2003 22:36:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309020523.WAA28180@smtp08.phx.gblx.net>
Reply-To: "Mark Goldberg" <goldber@globalcrossing.net>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I've built kernel 2.4.22 with the h.323 extensions from pom. Iptables is 1.2.8. I installed teh new kernel and included the following rules:

Basically, I want to only establish h.323 with a specific ip after I initiate it from an internal machine on the network normally using NAT.

/usr/local/sbin/iptables -t nat -A PREROUTING -s $SRC -p tcp -m state --state RELATED --dport 1503 -i eth0 -j LOG --log-level 6 --log-prefix "1503 in "  >>/var/log/netfiltersetup.log 2>&1
/usr/local/sbin/iptables -t nat -A PREROUTING -s $SRC -p tcp -m state --state RELATED --dport 1720 -i eth0 -j LOG --log-level 6 --log-prefix "1720 in "  >>/var/log/netfiltersetup.log 2>&1
/usr/local/sbin/iptables -t nat -A PREROUTING -s $SRC -p tcp -i eth0 -j LOG --log-level 6 --log-prefix "Anything else in "  >>/var/log/netfiltersetup.log 2>&1

/usr/local/sbin/iptables -t nat -A PREROUTING -s $SRC -p tcp -m state --state RELATED --dport 1503 -i eth0 -j DNAT --to $DEST  >>/var/log/netfiltersetup.log 2>&1
/usr/local/sbin/iptables -t nat -A PREROUTING -s $SRC -p tcp -m state --state RELATED --dport 1720 -i eth0 -j DNAT --to $DEST  >>/var/log/netfiltersetup.log 2>&1

There are no errors in netfiltersetup.log.

Iptables -L -v -n does not show the rules, but iptables-save does show them.

Nothing is logged and it does not seem to work. Before the rules were added, incoming to 1503 and 1720 triggered another rule that logged them.

Ethereal does not show any packets coming in that match the above. It did before the rules were added.

If anyone has a suggestion or can explain why listing the rules does not show any PREROUTING or POSTROUTING rules, please let me know.

I'm basically at a loss as to what to do next. Troubleshooting tips are welcome. Thanks.



Mark Goldberg
goldber@globalcrossing.net




