From: "Toni Casueps" <casueps@hotmail.com>
Subject: RE: osf module stopped working
Date: Mon, 06 Mar 2006 08:46:46 +0000
Message-ID: <BAY108-F28E306150EBFA3A5BCF0EDADE90@phx.gbl>
References: <BAY108-F4A28C49DFA945950211F4ADF50@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F4A28C49DFA945950211F4ADF50@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have discovered a interesting thing: the iptables rule works but only for 
some websites. I can access www.google.es but not es.yahoo.com from Windows. 
From Linux I can acces both.
Any ideas?


>
>I have a firewall where I was blocking Internet access only to Windows 
>clients. I have the osf module, the last version of the fingerprint file 
>from the openbsd web, and this rule:
>
>iptables -I FORWARD -j DROP -p tcp -m osf --genre Windows --smart
>
>This worked for some time but yesterday I checked it and now you can surf 
>the web from Windows and Linux. I have tried to add a rule to drop all 
>connections and insert a new one before that which accepts connections only 
>from Linux, but it doesn't work either. It's like it is unable to identify 
>the operating system, it doesn't seem to be about dropping connections 
>because I can drop every connection by inserting a drop rule without the 
>"-m osf --genre Windows --smart"
>
>If I go to
>http://lcamtuf.coredump.cx/p0f-help/
>it identifies my OS correctly, both if I visit it from Windows and Linux. 
>How can do the same test for the osf module that is installed in my 
>firewall?
>
>This is the output of iptables -L:
>
>
>Chain ACCEPT_ALL (1 references)
>target     prot opt source               destination
>ACCEPT     all  --  anywhere             anywhere            state NEW
>ACCEPT     all  --  anywhere             anywhere
>ACCEPT     icmp --  anywhere             anywhere            icmp 
>echo-request
>
>Chain BADTCP (2 references)
>target     prot opt source               destination
>PSCAN      tcp  --  anywhere             anywhere            tcp 
>flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
>PSCAN      tcp  --  anywhere             anywhere            tcp 
>flags:FIN,SYN,RST,PSH,ACK,URG/NONE
>PSCAN      tcp  --  anywhere             anywhere            tcp 
>flags:FIN,SYN,RST,PSH,ACK,URG/FIN
>PSCAN      tcp  --  anywhere             anywhere            tcp 
>flags:SYN,RST/SYN,RST
>PSCAN      tcp  --  anywhere             anywhere            tcp 
>flags:FIN,SYN/FIN,SYN
>NEWNOTSYN  tcp  --  anywhere             anywhere            tcp 
>flags:!FIN,SYN,RST,ACK/SYN state NEW
>
>Chain BLUEINPUT (1 references)
>target     prot opt source               destination
>
>Chain CUSTOMFORWARD (1 references)
>target     prot opt source               destination
>
>Chain CUSTOMINPUT (1 references)
>target     prot opt source               destination
>
>Chain CUSTOMOUTPUT (1 references)
>target     prot opt source               destination
>
>Chain DHCPBLUEINPUT (1 references)
>target     prot opt source               destination
>
>Chain DMZHOLES (1 references)
>target     prot opt source               destination
>
>Chain INPUT (policy DROP)
>target     prot opt source               destination
>ipac~o     all  --  anywhere             anywhere
>BADTCP     all  --  anywhere             anywhere
>           tcp  --  anywhere             anywhere            tcp 
>flags:SYN,RST,ACK/SYN limit: avg 10/sec burst 5
>CUSTOMINPUT  all  --  anywhere             anywhere
>ACCEPT     all  --  anywhere             anywhere            state 
>RELATED,ESTABLISHED
>ACCEPT     icmp --  anywhere             anywhere            icmp 
>echo-request
>ACCEPT     all  --  anywhere             anywhere            state NEW
>DROP       all  --  127.0.0.0/8          anywhere            state NEW
>DROP       all  --  anywhere             127.0.0.0/8         state NEW
>ACCEPT    !icmp --  anywhere             anywhere            state NEW
>ACCEPT     all  --  anywhere             anywhere
>BLUEINPUT !icmp --  anywhere             anywhere            state NEW
>ORANGEINPUT !icmp --  anywhere             anywhere            state NEW
>OUTGOINGFW  all  --  anywhere             anywhere            state NEW
>DHCPBLUEINPUT  all  --  anywhere             anywhere
>OPENVPN    all  --  anywhere             anywhere            state NEW
>IPSECRED   all  --  anywhere             anywhere
>IPSECBLUE  all  --  anywhere             anywhere
>REDINPUT   all  --  anywhere             anywhere
>XTACCESS   all  --  anywhere             anywhere            state NEW
>LOG        all  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `INPUT '
>
>Chain FORWARD (policy DROP)
>target     prot opt source               destination
>DROP       tcp  --  anywhere             anywhere            OS fingerprint 
>match Windows
>ipac~fi    all  --  anywhere             anywhere
>ipac~fo    all  --  anywhere             anywhere
>BADTCP     all  --  anywhere             anywhere
>TCPMSS     tcp  --  anywhere             anywhere            tcp 
>flags:SYN,RST/SYN TCPMSS clamp to PMTU
>CUSTOMFORWARD  all  --  anywhere             anywhere
>ACCEPT     all  --  anywhere             anywhere            state 
>RELATED,ESTABLISHED
>ACCEPT     all  --  anywhere             anywhere            state NEW
>DROP       all  --  127.0.0.0/8          anywhere            state NEW
>DROP       all  --  anywhere             127.0.0.0/8         state NEW
>ACCEPT_ALL  all  --  anywhere             anywhere
>OUTGOINGFW  all  --  anywhere             anywhere            state NEW
>OPENVPN    all  --  anywhere             anywhere            state NEW
>DMZHOLES   all  --  anywhere             anywhere            state NEW
>PORTFWACCESS  all  --  anywhere             anywhere            state NEW
>LOG        all  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `FORWARD '
>
>Chain IPSECBLUE (1 references)
>target     prot opt source               destination
>
>Chain IPSECRED (1 references)
>target     prot opt source               destination
>
>Chain LOG_DROP (0 references)
>target     prot opt source               destination
>LOG        all  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning
>DROP       all  --  anywhere             anywhere
>
>Chain LOG_REJECT (0 references)
>target     prot opt source               destination
>LOG        all  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning
>REJECT     all  --  anywhere             anywhere            reject-with 
>icmp-port-unreachable
>
>Chain NEWNOTSYN (1 references)
>target     prot opt source               destination
>LOG        all  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `NEW not SYN? '
>DROP       all  --  anywhere             anywhere
>
>Chain OPENVPN (2 references)
>target     prot opt source               destination
>
>Chain ORANGEINPUT (1 references)
>target     prot opt source               destination
>
>Chain OUTGOINGFW (2 references)
>target     prot opt source               destination
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:http
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:https
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
>ACCEPT     tcp  --  anywhere             anywhere            tcp 
>dpt:ftp-data
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:domain
>ACCEPT     udp  --  anywhere             anywhere            udp dpt:domain
>ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ntp
>ACCEPT     udp  --  anywhere             anywhere            udp dpt:ntp
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination
>ipac~i     all  --  anywhere             anywhere
>CUSTOMOUTPUT  all  --  anywhere             anywhere
>
>Chain PORTFWACCESS (1 references)
>target     prot opt source               destination
>ACCEPT     tcp  --  anywhere             192.168.0.71        tcp dpt:http
>ACCEPT     tcp  --  anywhere             192.168.0.70        tcp dpt:smtp
>ACCEPT     tcp  --  anywhere             192.168.0.70        tcp dpt:imap
>
>Chain PSCAN (5 references)
>target     prot opt source               destination
>LOG        tcp  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `TCP Scan? '
>LOG        udp  --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `UDP Scan? '
>LOG        icmp --  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `ICMP Scan? '
>LOG        all  -f  anywhere             anywhere            limit: avg 
>10/min burst 5 LOG level warning prefix `FRAG Scan? '
>DROP       all  --  anywhere             anywhere
>
>Chain REDINPUT (1 references)
>target     prot opt source               destination
>
>Chain SIPROXD (0 references)
>target     prot opt source               destination
>
>Chain XTACCESS (1 references)
>target     prot opt source               destination
>ACCEPT     tcp  --  anywhere             192.168.1.175       tcp dpt:ident
>
>Chain ipac~fi (1 references)
>target     prot opt source               destination
>           all  --  anywhere             anywhere
>           all  --  anywhere             anywhere
>
>Chain ipac~fo (1 references)
>target     prot opt source               destination
>           all  --  anywhere             anywhere
>           all  --  anywhere             anywhere
>
>Chain ipac~i (1 references)
>target     prot opt source               destination
>           all  --  anywhere             anywhere
>           all  --  anywhere             anywhere
>
>Chain ipac~o (1 references)
>target     prot opt source               destination
>           all  --  anywhere             anywhere
>           all  --  anywhere             anywhere
>
>
>



