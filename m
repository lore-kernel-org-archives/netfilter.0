From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Forwarding
Date: Tue, 28 Dec 2004 12:30:54 -0500
Message-ID: <1104255053.7318.28.camel@hubcap.ljm.dom>
References: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-12-28 at 12:19, umar draz wrote:
> Hi Dear Members!
>  
>   i have linux machine which configured as a router
>  
>   my linux router has 2 NIC one with Public ip 202.147.167.99 and other is local ip 192.168.0.1
>   i have a another linux machine which configured as a FTP server and that machine ip is 192.168.0.5. Now i want my this ftp server can be access all world. so what kind of iptables rules will be add on linux router that if some one want to access ftp 202.147.167.99 its automaticaly forward or redirect my local machine 192.168.0.5.
>  
>  Please help me in this regard
>  
> Thanks
>  
> Umar

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d 202.147.167.99 \
  --dport 21 -j DNAT --to-destination 192.168.0.5

iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d 192.168.0.5 \
  --dport 21 -j ACCEPT

the above assumes you have a rule in FORWARD that accepts established
packets, such as:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

hth...

-j

--
"Well, I'm tired of being a wannabe league bowler. I wanna be a
 league bowler!"
	--The Simpsons


