From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: natting help needed urgently.
Date: Sat, 6 Sep 2003 12:29:35 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPCEICCIAA.markee@bandwidthco.com>
References: <20030907110417.GA1463@linux.local>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030907110417.GA1463@linux.local>
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
To: Payal Rathod <payal-iptables@staticky.com>, netfilter@lists.netfilter.org

Here is an example for HTTP.  All the services will work the same except for
the destination port number.  This needs to be done in two stages basically:

Step 1 is to DNAT the requests from the firewall box to your internal
Windows server (prerouting):

####################################################################
# SET VARIABLES
####################################################################
WINDOWS_IP="192.168.10.3"

####################################################################
# HTTP/SHTTP
####################################################################
# send all new incoming web requests to HTTP server (HTTP & SHTTP)
if [ "$WINDOWS_HTTP_AVAILABLE" = "1" ] && [ "$HTTP_SERVER" = "1" ];
then
	$IPT -t nat -A PREROUTING -p tcp --destination-port 80 -i $FW_INET_IFACE -j
LOG --log-prefix "DNAT IN WINDOWS HTTP: "
	$IPT -t nat -A PREROUTING -p tcp --destination-port 80 -i $FW_INET_IFACE -j
DNAT --to $WINDOWS_IP:80
	$IPT -t nat -A PREROUTING -p tcp --destination-port 443 -i
$FW_INET_IFACE -j LOG --log-prefix "DNAT IN WINDOWS SHTTP: "
	$IPT -t nat -A PREROUTING -p tcp --destination-port 443 -i
$FW_INET_IFACE -j DNAT --to $WINDOWS_IP:443
fi

Step 2 is to accept the packets after they have been DNATed:

$IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -d $WINDOWS_IP -p
tcp --source-port $UNPRIVPORTS --destination-port 80 -m state --state NEW -j
LOG --log-prefix "WEB ACCESS -> WINDOWS BOX: "
$IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -d $WINDOWS_IP -p
tcp --source-port $UNPRIVPORTS --destination-port 80 -m state --state NEW -j
ACCEPT
$IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -d $WINDOWS_IP -p
tcp --source-port $UNPRIVPORTS --destination-port 443 -m state --state
NEW -j LOG --log-prefix "SWEB ACCESS -> WINDOWS BOX: "
$IPT -t filter -A TCP_RULES -i $FW_INET_IFACE $WINDOWS_IP -p
tcp --source-port $UNPRIVPORTS --destination-port 443 -m state --state
NEW -j ACCEPT

Hope this helps.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Payal Rathod
Sent: Sunday, September 07, 2003 4:04 AM
To: netfilter@lists.netfilter.org
Subject: natting help needed urgently.


Hi,
I have asked this before but nobody responded. Is this un-do-able?
I have a windows box which is on intertnal ip 192.168.10.3. I want the
outside world to access the servers (ftp, http, smtp, pop3) from it.
The scene is something like this,


+----------+       +--------------+         +---------------+
|          +---><--+ Linux        +---->--<-+win2k          |
|router    |       |  (1.2.3.4)   |         | (192.168.10.3)|
+----------+       +--------------+         +---------------+

I am not able to redirect any request for windows box from outside world
to internal machine 192.168.10.3

Please help me to solve this problem.

Waiting eagerly for any help on this.

With warm regards,
-Payal

--
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.



