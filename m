From: Andreas Meyer <anmeyer@gmx.net>
Subject: Problems with prerouting
Date: Mon, 29 Sep 2003 17:55:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030929155529.E451617C80@delta.anup.de>
Reply-To: anmeyer@gmx.net
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

Hi!

I could need some help with setting up a prerouting for a webserver
on my gateway.


    static-Internet-IP on eth1
                |
        +----------------+
        |                |
        | 192.168.20.210 |
        |    on eth0     |
        +----------------+
                |
            +-----------+
            |           |
       +---------+ +----------+
       |         | |          |
   192.168.20.60 | | 192.168.20.61
      Squid      | |    Webserver
       |         | |          |
   192.168.1.75  | |          |
       +---------+ +----------+
           |

       +--------+
   192.168.1.3  |
      WKS       |
       +--------+

I addes a rule before all other forwarding and input and output
rules:

iptables -A FORWARD -p TCP -d 192.168.20.61 --dport 8080 -j ACCEPT
iptables -t nat -A PREROUTING -p TCP -d 192.168.20.210 --sport 1024: \
                          --dport 80 -j DNAT --to 192.168.20.61:8080

When I contact the proxy on 192.168.20.60 from 192.168.1.3 or from within the
the DMZ at 192.168.20.60 to call 192.168.20.210, nothing happens,
nothing in the logs.

What kind of problem do I have here? Is it possible at all to test such
a prerouting-rule from within the DMZ or the local network?

Thank you for listening!

-- 
  Andreas Meyer           | http://www.anup.de
                          | http://home.wtal.de/MeineHomepage


