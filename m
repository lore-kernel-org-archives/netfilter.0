From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: DNAT question
Date: Mon, 14 Jun 2004 11:12:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087225937.5254.56.camel@localhost>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A37999@PDBEX01E.pdb.fsc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A37999@PDBEX01E.pdb.fsc.net>
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
To: "Arnauts, Bert" <Bert.Arnauts@fujitsu-siemens.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-06-14 at 10:35, Arnauts, Bert wrote:
> Hello all,
> 
> I want to DNAT some machines in another subnet.
> The target machines have ip's like 11.0.0.x/24
> 
> My available lan ip's are 172.239.239.x/27 (255.255.255.224)
> 
> These are my rules. Wich are apparently not working.
> I created virtual interfaces on eth1, one for each DNAT'ed ip.
> 
> What am I missing ? Forget about normal tables stuff, I only want this
> machine to do DNAT.
> 
> Thx,
> 
> 
> INET_IP="172.25.239.208"
> INET_IFACE="eth1"
> INET_BROADCAST="172.25.239.223"
> LAN_IP="11.0.0.1"
> LAN_IP_RANGE="11.0.0.0/24"
> LAN_IFACE="eth0"
> LO_IFACE="lo"
> LO_IP="127.0.0.1"
> IPTABLES="/sbin/iptables"
> echo "1" > /proc/sys/net/ipv4/ip_forward
> $IPTABLES --flush
> $IPTABLES --table nat --flush
> $IPTABLES --delete-chain
> $IPTABLES --table nat --delete-chain
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source
> $INET_IP
> $IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -d 172.25.239.220/255.255.255.224 -j
> DNAT --to 11.0.0.9
In what way are they not working?
In this rule set you are saying that every packet going out eth1 should
have the source changed to the source of the gateway and all packets to
172.25.239.220/27 should have their DA changed to 11.0.0.9 regardless of
interface.  Is that what you want it to do?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


