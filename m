From: "Mesut Bayrak" <mbayrak@datagrup.com.tr>
Subject: FW: Nat problem
Date: Mon, 20 Mar 2006 15:40:13 +0200
Message-ID: <18413.6101430797$1142862065@news.gmane.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi people 
    I have a little nat problem
 
I write that 
    iptables -t nat -I POSTROUTING -p tcp -d X.X.X.X --dport 88 -j DNAT
--to-destination X.X.X.X --dport 80
 
and i just get that 
 
iptables v1.2.7a: Only one `--destination-port' allowed
Try `iptables -h' or 'iptables --help' for more information.
 
 
What i was trying to do was  
 
                                  _______
________________
internet------>----port 88  firewall  --->--- port 80  : machine on the lan 


How can i do it :) ?                           


