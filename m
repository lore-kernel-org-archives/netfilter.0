From: Daniel Camacho <dcamacho@saipan.com>
Subject: IPTables & Squid
Date: Fri, 01 Aug 2003 09:51:19 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20030801094250.02f127f0@mail.saipan.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi all,

I'm new to this list and to IPtables. I recently installed a transparent 
proxy using Squid and IPtables. On one computer, I installed IPtables and 
forward all port 80 requests to the Squid server, which is running on a 
separate server. On that same computer I want to be able to filter certain 
connections from using the Squid. I know I can do this with Squid, but I 
want to know how to do it with IPtables. Does anyone know how may I go 
about doing this? Thanks.

Daniel

Here's the script I use:

192.168.0.1 = Squid server
192.168.0.25 = Netfilter Server

# start up filter rules for traffic redirection to Squid
iptables -t nat -A PREROUTING -i eth0 -s ! 192.168.0.1 -p tcp --dport 80 -j 
DNAT --to 192.168.0.1:3128

# Add for 0 subnet
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -d 192.168.0.1 -j 
SNAT --to 192.168.0.25
iptables -A FORWARD -s 192.168.0.0/24 -d 192.168.0.1 -i eth0 -o eth0 -p tcp 
--dport 3128 -j ACCEPT
#
# Add for 2 subnet
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.0/24 -d 192.168.0.1 -j 
SNAT --to 192.168.0.25
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.0.1 -i eth0 -o eth0 -p tcp 
--dport 3128 -j ACCEPT
#
# Add for 3 subnet
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.3.0/24 -d 192.168.0.1 -j 
SNAT --to 192.168.0.25
iptables -A FORWARD -s 192.168.3.0/24 -d 192.168.0.1 -i eth0 -o eth0 -p tcp 
--dport 3128 -j ACCEPT


