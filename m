From: eth <eth@finsiel.ro>
Subject: DNAT w ssh tunnel
Date: Fri, 21 Jun 2002 10:28:30 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D12D59E.6020709@finsiel.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi listers.

I try to make a simple tunnel for a jdbc connection with port forward from one machine to another via a firewall.

|client| --Inet--> |firewall| --LAN--> |database|

The client runs a ssh client with port forwarding to the firewall machine. On the fw I have the "simpleproxy" which is a tcp proxy that forwards all local sockets to a remote host. Yet I thought I should do a:

iptables -t nat -A OUTPUT -d 194.226.254.1 -p tcp -m tcp --dport 1521 -j DNAT --to-destination 192.168.10.100:1521

... which should do the fw->database port forward trick; it doesn't. :-|

Dumping, it looks like packets leave from 192.168.10.1 (which is internal eth firewall) to 192.168.10.100 (which is the database server) , the server says SYN ACK and then the firewall sends a RST !! Why? Isn't DNAT supposed to keep track of all connection even those DNATed? What am I missing? The linux part is a RH 7.3 with a 2.4.18 from kernel.org.





