From: iansolo <iansolo.netfilter@betisgroup.com>
Subject: Re: ftp nat  MAX PORTS
Date: Mon, 07 Feb 2005 12:42:18 +0100
Message-ID: <4207541A.7030700@betisgroup.com>
References: <420100AF.1040105@betisgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420100AF.1040105@betisgroup.com>
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
To: netfilter@lists.netfilter.org

Hi,
somebody have understand my problem?

thanks

iansolo wrote:
> Hi All,
> I've a problem with ftpserver behind a NAT.
> My necessity is to run ftpserver in a different port then 21.
> This is the situation:
> 
> Router
> |
> Firewall
> |
> Ftpserver
> 
> I use this modules ad pass these parameters :
> 
> /sbin/modprobe ip_tables
> /sbin/modprobe ip_conntrack
> /sbin/modprobe ip_conntrack_ftp ports=21,9000
> /sbin/modprobe iptable_nat
> /sbin/modprobe ip_nat_ftp ports=21,9000
> /sbin/modprobe ipt_MASQUERADE
> /sbin/modprobe ipt_state
> 
> The realtive iptables rules are only these:
> 
> $IPTABLES -t nat -A PREROUTING -p tcp -d $EXT_LAN_FW --dport 9000 -j NAT 
> --to-destination $IP_FTPSERVER:9000
> $IPTABLES -A FORWARD -i $EXT_IF -p tcp --dport 9000 -j ACCEPT -d 
> $IP_FTPSERVER
> 
> Unfortunately don't work!
> 
> 
> VERY IMPORTANT :
> 
> - All work fine is the port is 21!!
> 
> - When I try to connect with my ftp-client(with port 9000), at a certain 
> point I tray to send packets to local IP of firewall ($EXT_LAN_FW).....
> 
> Others Questions:
> 
> - In the source code of ip_conntrack_ftp there is a variable "MAX_PORTS",
> but I don't understand what mean...
> - What is "Patch-O-Matic" ?
> 
> 
> Thanks a lot in advance!
> iansolo
> 
> ps: excuse me, my English is poor
> 
> 
> 
> 
> ________ Information from NOD32 ________
> This message was checked by NOD32 Antivirus System for Linux Mail Server.
> http://www.nod32.com


