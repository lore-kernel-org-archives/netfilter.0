From: "Lawrence - D" <ingsiong@daltron.com.pg>
Subject: linux firewall/IPTABLES Vs Mediaring VOip
Date: Mon, 4 Aug 2003 12:04:30 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a501c35a2c$beaac7b0$7700000a@lawrencewin2k>
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

Hi,
    I'm new to Linux RedHat O/S. My RedHat 8.0 is connected by  lease line
to internet service. I'm running Squid for proxy service. I implement the
medium level firewall with default setting on linux firewall/IPTABLES.
    Now my LAN user want to use mediaring VOIP service. I check the website
FAQ and found the following :-

10. Can the Prepaid Service work behind a firewall?
The Prepaid Calls Service currently supports PC-to-Phone calls from behind
firewalls. If you are connected to the Internet using LAN, you may be behind
a firewall, which will prevent you from connecting to our Internet gateways.
To make calls from behind your firewall, you need to set the firewall
settings by clicking on the link "Settings" on the web page and select "Use
Firewall" for SOCKS5.
To use NAT firewall, you will need to open or ask your Network Administrator
to open the following outgoing ports for UDP and TCP: 51719(UDP), 51720(TCP)
and 1800-1810(UDP).

    Can anyone guide me how to open the port on server so that my LAN user
can use Mediaring ?

Best Regards,

Lawrence Tang


