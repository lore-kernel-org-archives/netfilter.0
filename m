From: Craig Thew <craig@ljhpm.com.au>
Subject: RE: Restricted Access
Date: Tue, 08 Jul 2003 09:12:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005701c344dd$4eb5bbe0$b900a8c0@ljhpm.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

thanks for your responses
All my clients have fixed IP's
And are on an internal net of 192.168.0/24

This is my /etc/sysconfig/iptables

*nat
:PREROUTING ACCEPT [3803:230566]
:POSTROUTING ACCEPT [11:858]
:OUTPUT ACCEPT [13:1026]

-A POSTROUTING -s 192.168.0.0/255.255.255.0 -j MASQUERADE

COMMIT

*mangle
:PREROUTING ACCEPT [15299:1685366]
:OUTPUT ACCEPT [1947:581477]

COMMIT

*filter
:INPUT DROP [2789:198491]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [1953:582221]
:firewall - [0:0]

# Ban this PC
-A FORWARD -s 192.168.0.245 -i eth0 -j firewall

This is the bit that I cant get to work
I can stop the client 192.168.0.245 to get the net at all with the above
rule 
But then I want that client to be able to go to 1.2.3.4


-A FORWARD -s 192.168.0.245 -d 1.2.3.4 -p tcp -m tcp --sport 80 -j
ACCEPT 
-A FORWARD -s 192.168.0.245 -d 1.2.3.4 -p tcp -m tcp --dport 80 -j
ACCEPT

Thanks for your time

CT



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Rob Sterenborg
Sent: Monday, July 07, 2003 6:43 PM
To: netfilter@lists.netfilter.org
Subject: RE: Restricted Access


> I have a very basic iptables setup to allow my windows clients to 
> access the net through iptables, What I want to do is allow some 
> clients to have full access the any websites and others to be 
> resticted to certain sites only, Can iptables do this?. Does someone 
> have an example
> or point me in the right direction     

What is your setup ?
Do your clients have fixed IP addresses ?

Example :

FULL="192.168.0/24"
RESTRICTED="192.168.1/24"
ACCESS_SITES="a.b.c.d e.f.g.h ..."

# Full access clients
iptables -A FORWARD -i <if_in> -o <if_out> -s $FULL -j ACCEPT

#Restricted access clients
for IP in $ACCESS_SITES ; do
  iptables -A FORWARD -i <if_in> -o <if_out> -s $RESTRICTED -d $IP -j
ACCEPT done


Gr,
Rob



