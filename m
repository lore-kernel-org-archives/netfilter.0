From: "Ben" <nigma@nigma.info>
Subject: RE: Trouble rejecting connections
Date: Wed, 28 Jan 2004 16:50:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AlxZm-0003j0-6i@aphex.cyberpixels.com>
References: <4017B743.2030906@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4017B743.2030906@Loudoun-Fairfax.com>
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

Jeff wrote:

You need to move these DROP and LOG rules up so they come before the ACCEPT
rules. Otherwise the packets may have already been accepted.

Ok, I've now edited the script so it looks like this

IPTABLES="/sbin/iptables"

#Flush everything, start from scratch
$IPTABLES -F

#Set default policies to DROP
$IPTABLES -P INPUT DROP
$IPTABLES -P FORWARD DROP

#Add DENY people here
$IPTABLES -A INPUT -s blocked.ip.address.here -j DROP

#Allow all lo traffic
$IPTABLES -A INPUT -i lo -s 0.0.0.0/0 -d 0.0.0.0/0 -j ACCEPT

#Allow all related and established connections
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#Set default OUTPUT policy to ACCEPT
$IPTABLES -P OUTPUT ACCEPT

# Open ports for server/services
$IPTABLES -A INPUT -p tcp --dport 20 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 21 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 37 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 43 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 465 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 465 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 873 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 873 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 995 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2082 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2083 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2086 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2087 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2089 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 2095 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 3306 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 6666 -j ACCEPT

#Enable Blogger support (non-standards compliant piece of dogshit that it
is)
$IPTABLES -A INPUT -s 66.102.15.83 -j ACCEPT
$IPTABLES -A INPUT -s 216.34.7.186 -j ACCEPT

#Add passive-mode people here
#$IPTABLES -A INPUT -s xxx.xxx.xxx.xxx -j ACCEPT

#Logging
$IPTABLES -A INPUT -j LOG --log-prefix "INPUTDEFAULT: "

#Save rules
iptables-save > /etc/sysconfig/iptables

#Restart for rules to take effect
service iptables restart

However, I am still able to connect from blocked.ip.address.here




