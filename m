From: George Georgalis <georgw@galis.org>
Subject: Re: ssh connecting to wrong machine....
Date: Sun, 2 Jun 2002 23:04:01 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020602230401.C16556@trot.haven.dom>
References: <20020602192157.A16556@trot.haven.dom>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020602192157.A16556@trot.haven.dom>; from georgw@galis.org on Sun, Jun 02, 2002 at 07:21:57PM -0400
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I tried adding this to the nat but it didn't fix it...

iptables -t nat -A POSTROUTING -p tcp -s $LAN_host04 -j SNAT --to-source $EXT_host04

:-\

Is my masq getting in the way? What's the best way to fix?


# iptables -t nat -vL
Chain PREROUTING (policy ACCEPT 815K packets, 38M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DNAT       tcp  --  any    any     $EXT_host04	  anywhere           to:$LAN_host04
    0     0 DNAT       tcp  --  any    any     anywhere             anywhere           tcp dpt:50422 to:$LAN_host04:22

Chain POSTROUTING (policy ACCEPT 5896 packets, 363K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 SNAT       tcp  --  any    any     us04                 anywhere           to:$EXT_host04
    0     0 MASQUERADE  all  --  any    eth1    anywhere             anywhere

Chain OUTPUT (policy ACCEPT 58945 packets, 3850K bytes)
 pkts bytes target     prot opt in     out     source               destination


Thanks,
// George


On Sun, Jun 02, 2002 at 07:21:57PM -0400, George Georgalis wrote:
>On a 2 interface firewall, I've set up an alias eth1:1 ($EXT_host04) to
>an IP on our T-1, then added a nat which should connect ports $TCP_OPEN
>and $UDP_OPEN to the internal IP ($LAN_host04).
>
>But when I go to ssh $EXT_host04 from the internet I end up talking to
>the firewall sshd, not the sshd on $LAN_host04. Why is that? Here are my
>rules:
>
>LANIF=eth0
>EXTIF=eth1
>TCP_OPEN="22,25,53,80"
>UDP_OPEN="22,53"
>
>iptables -A INPUT -m state --state ESTABLISHED,RELATED \
>-j ACCEPT
>
>iptables -A INPUT -i $EXTIF -m state --state NEW \
>-p tcp -m multiport --dport $TCP_OPEN -j ACCEPT
>
>iptables -A INPUT -i $EXTIF -m state --state NEW \
>-p udp -m multiport --dport $UDP_OPEN -j ACCEPT
>
>
>iptables -A FORWARD -i $EXTIF -o $LANIF -p tcp \
>-m multiport --dport $TCP_OPEN \
>-m state --state NEW,RELATED,ESTABLISHED \
>-j ACCEPT
>
>iptables -A FORWARD -i $EXTIF -o $LANIF -p udp \
>-m multiport --dport $UDP_OPEN \
>-m state --state NEW,RELATED,ESTABLISHED \
>-j ACCEPT
>
>
>iptables -t nat -A PREROUTING -p tcp \
>-s $EXT_host04 \
>-j DNAT --to-destination $LAN_host04
>
>iptables -t nat -A POSTROUTING -o $EXTIF \
>-j MASQUERADE
>
>
>Thanks,
>// George
>
>-- 
>GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
>Security Services, Web, Mail,            mailto:george@galis.org 
>File, Print, DB and DNS Servers.       http://www.galis.org/george 
>

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


