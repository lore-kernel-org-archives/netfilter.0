From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Wed, 11 Dec 2002 08:32:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D1021AE36D@eketsv02.cubis.de>
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

Hi

I'm not entirely sure what you want to do, but here goes.

> I have an internel ftp server w/c i want to access over my 
> linux router(gw)
> Its internel IP is 10.0.0.11 and port 21. My externel IP lets say
> 203.100.100.1.
> I followed the docs w/c i found at linuxdoc
> http://www.tldp.org/HOWTO/IP-Masquerade-HOWTO/forwarders.html
> I type in this iptables rule set,
> 
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> iptables -A PREROUTING -t nat -p tcp -d $EXTIP --dport 21 -j DNAT --to
> 10.0.0.11:21
> 
> I enabled ip forwarding thru the kernel by typing this 
> command, (this is the
> first thing i type then the iptables rule set)
> 
> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> svr:/# cat /proc/sys/net/ipv4/ip_forward
> 1
> svr:/#
> 
> And still it does not work..
> 
> Trying 203.100.100.1...
> telnet: Unable to connect to remote host: Connection refused

I expect you're trying to access the FTP server on 10.0.0.11 from the
Internet by redirecting connections to the firewall's external IP address
(203.100.100.1) to the FTP server.

I haven't dealt with D/SNATing FTP yet and it's one of the more complicated
protocols to do this for (and it's a horrible protocol anyway, so you should
avoid it entirely if you can), but I believe you need to do the following:

Prerequisites:
1. Load the FTP conntrack and FTP NAT modules (maybe the basic conntrack
module as well), enable IP forwarding.

Take care of the FTP control connection:
2. Permit INPUT on the outside interface of the firewall to TCP port 21 with
states NEW and ESTABLISHED
3. Permit OUTPUT on the outside interface of the firewall from TCP port 21
with state ESTABLISHED
4. In the PREROUTING chain use DNAT to redirect packets "-p tcp -d
203.100.100.1 --dport 21" (see point 2 above) to the internal server at
10.0.0.11.
5. Permit FORWARDing of those same packets with states NEW and ESTABLISHED.
6. Permit FORWARDing of response packets ("-s 10.0.0.11 --sport 21") with
state ESTABLISHED.

The FTP data connection:
a) Active FTP:
7. Permit FORWARDing from the internal server, TCP source port 20, with
states ESTABLISHED and RELATED.
8. Permit FORWARDing to the internal server, TCP destination port 20, with
state ESTABLISHED.
9. Permit OUTPUT from the firewall's outside interface (and source IP
address), TCP source port 20, with states ESTABLISHED and RELATED.
10. Permit INPUT on the firewall's outside interface (and IP), TCP
destination port 20, state ESTABLISHED.

You may also need to SNAT the outbound packets to the firewall's outside IP
address in the POSTROUTING chain.

b) Passive FTP:
11. Permit INPUT on the firewall's outside interface (and IP), TCP
destination port 1024-65535, states ESTABLISHED and RELATED
12. PREROUTING DNAT those packets to the internal server.
13. FORWARD them with states ESTABLISHED and RELATED
14. FORWARD the ESTABLISHED return packets
15. OUTPUT the ESTABLISHED return packets.

Check to see if that works. Add a catch-all logging rule to the end of all
chains you use and see if it gets hit by anything when debugging.

Cheers
Tobias

