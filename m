From: jrw@ngi.be
Subject: DNAT a range of  ports to another range of portts
Date: Mon, 25 Nov 2002 13:44:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A4C806B83AC1974E8A2AC21267B922D62D27DC@exchange.int.ngi.be>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all
I want to DNAT a connection to range of ports to another server but there
with others ports
ex :
client ip
10.100.2.5
---------
 |
 |
---------
10.200.2.10 [5600 -> 5609]
Router
192.168.2.10
---------
 |
 |
---------
192.168.2.2 [9000 -> 9009]
Appl Server

This rule will nat with the same range of ports
${IPTABLES} -t nat -I PREROUTING -p TCP -i $INET_IFACE -s 0/0 -d $INET_IP
--dport $START_PORT:$END_PORT -j DNAT --to $APPL_IP

I'm able to dnat for a range of port to the same range, but how could I
change it?
Is it possible?

-- 
  .''`. | Jean-Robert WIAME 
 : :' : | jrw AT ngi.be
 `. `'  | BELGIUM 
   `-   |  
--


