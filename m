From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: port-based filtering of IPsec packets?
Date: Fri, 25 Jul 2003 07:37:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192CB@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Rick Kennell <kennell@ecn.purdue.edu>, Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

>Surely there must be some way of doing port-based filtering of ESP
>packets that are known to be bound for the local host.
If the packet isn't intended for the firewall/ipsec server, then it's =
forwarded unencrypted to the internal hosts.... I'm sure by then the =
data in decrypted right? Because it can't pass an encrypted packet to a =
host who isn't using IPSEC.

Can you put -j LOG rules in the FORWARD chain to filter on it? Mine =
appear to pickup port 23 telnet sessions... sorry if what you want isn't =
this..


[root@firewall root]# iptables -I FORWARD -i ipsec0 -o eth0 -p tcp =
--dport 23
[root@firewall root]# iptables -L FORWARD -n -v -x
Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination
       2      104            tcp  --  ipsec0 eth0    0.0.0.0/0           =
 0.0.0.0/0          tcp dpt:23


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

