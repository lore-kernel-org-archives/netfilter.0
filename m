From: Simon Kitching <simon@ecnetwork.co.nz>
Subject: connection dropping for large data flows
Date: Mon, 10 Nov 2003 17:08:01 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068437281.1517.23.camel@pcjohns.ecnnz.ecnetwork.co.nz>
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

I'm trying to set up iptables on a RedHat 8.0 server. I've got a setup
I'm happy with, except for one major problem; I hope someone can help.

When I SSH to the machine, I can run commands, vi, etc. However when I
run any command which generates more than a few lines of output, the ssh
session hangs (from the perspective of the ssh client).

Examples of commands that cause the "hang":
 * ls -l
 * more some-reasonable-size-file
 * ps -efl

I presume I'm missing something simple, like a rule for "fragmented
packets" or something similar. The iptables rules I am using are below.

Help would be much appreciated!

One other minor problem: I can't get "ping" from the server back to
itself to work either. I can't tell whether the machine can be pinged
from any other host, because there are other firewalls between my
desktop and the target server and I don't currently have access to
another host on the same network as the target server. Is this perhaps
because the ping "acknowledgement" packet isn't being allowed back in?

Thanks in advance,

Simon

------- iptables.conf

# don't forward any packets; this isn't a router!
iptables -P FORWARD DROP
iptables -F FORWARD
                                                                                                                 # allow all packets outbound
iptables -P OUTPUT ACCEPT
iptables -F OUTPUT

# deny inbound packets unless explicitly allowed
# by other rules
iptables -P INPUT DROP
iptables -F INPUT
                                                                                                                 # generic sanity rule that checks packet types;
#   connection request (syn) packets are ok
#   packets related to existing connections are ok
# anything else is probably bad.
                                                                                                                 iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP
                                                                                                                 # allow ping, for convenience
iptables -A INPUT -p ICMP --icmp-type ping -j ACCEPT

# allow connections from the local host back to
# any port on the local host.
iptables -A INPUT -p ALL -s 127.0.0.1 -j okay
                                                                                                                 # Bloody IBM's MQSeries endmqm tool appears to need to connect
# from the external ip address of this machine back to itself.
#
# If this host's ip address changes, then the line below needs
# to be changed appropriately.
iptables -A INPUT -p ALL -s xxx.xxx.xxx.xxx -j okay
                                                                                                                 # allow incoming SSH from any host
iptables -A INPUT -p TCP --destination-port 22 -j okay

# allow incoming NTP (Network Time Protocol) UDP packets
iptables -A INPUT -p UDP --destination-port 123 -j okay

# allow incoming MQ from any host
iptables -A INPUT -p TCP --destination-port 1414 -j okay
                                                                                                                 


