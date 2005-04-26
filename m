From: "Stefan-Michael. Guenther (in-put GbR)" <S.Guenther@in-put.de>
Subject: Accounting with iptables vs. snmp
Date: Tue, 26 Apr 2005 13:45:44 +0200
Message-ID: <200504261345.45177.S.Guenther@in-put.de>
Reply-To: S.Guenther@in-put.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

using iptables I have setup a traffic accounting on one of our client's 
gateways:

iptables -A INPUT -i $WAN -j LOG --log-level debug
iptables -A OUTPUT -o $WAN -j LOG --log-level debug
iptables -A FORWARD -j LOG --log-level debug

syslogd collects the entries in a single file which is analysed daily.

The results corresponds to the amount of data I get with "iptables -L -v -n" .

The provider of our client uses snmp on his router to calculate the traffic.

Strange, but true: The numbers are never the same, sometimes iptables logs 
more traffic, sometimes snmp. The differences are between 1 and 25 %.

Obviously someone is doing something wrong. The provider is one of Germany's 
big player, so I guess I made the mistake. But where and why?

Thanks for any hint.

Stefan
-- 

*****************************************
in-put GbR - Das Linux-Systemhaus
Stefan-Michael Guenther
Moltkestrasse 49     D-76133 Karlsruhe
Tel./Fax : +49 (0)721 / 83044 - 98/93
http://www.in-put.de
*****************************************

