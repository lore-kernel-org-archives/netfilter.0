From: Mailingliste <liste@sdr.info>
Subject: prob accessing server in DMZ from LAN with official IP
Date: Tue, 17 Jun 2003 23:57:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.0.20030617233726.02c98360@mail.sdr.co.at>
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

My problem is the following:

I have a DMZ between  2 Firewalls. In the DMZ there are Nameserver, 
HTTP-Server, etc.
I have 10 official IP-Addresses. The DMZ has IP-Adresses 192.168.0.0/24. 
The LAN has
the net 192.168.1.0/24. With DNAT I transfer the first official IP to lets 
say 192.168.0.17
for the nameserver. the second to 192.168.0.20 to the mailserver, and so 
on. This works OK.
The nameserver is authoritativ for the domain lets say "myname.at". when i 
make a
"dig www.myname.at" from outside i get the right answer. But when I type
"dig www.myname.at" from the LAN at lets say 192.168.1.12 i get the answer 
"no servers could be reached".
with tcpdump on the outer firewall i see the packet with source 
192.168.0.25 (the DMZ-IP of the inner
firewall) and destination the official IP of the nameserver. But no more 
translation from the official IP to the
DMZ-IP of the nameserver.
In my rules i have put:
$IPTABLES -t nat -A PREROUTING -i $INT_IF -p udp --sport 1024:65535 \
           -d $PUBLIC_DNS1 --dport 53 -j DNAT --to-destination $DMZ_DNS1

$IPTABLES -A FORWARD -i $INT_IF -o $INT_IF -p udp --sport 1024:65535 \
           -d $DMZ_DNS1 --dport 53 -m state --state NEW -j ACCEPT
but its not working.

Has anybody a hint what to do ?

Thanks Fritz



