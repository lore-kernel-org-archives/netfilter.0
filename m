From: "Test Mail" <testmail@peterpaul.com.ph>
Subject: Re: FTP Forwarding
Date: Fri, 14 Jan 2005 16:57:02 +0800
Message-ID: <001301c4fa17$03de2b20$0200a8c0@etpi>
References: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
	<1104255053.7318.28.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi!Can i have a follow up question regarding FTP server inside internal LAN
which can be seen in the internet.....
now what if the scenario is i want to restrict a specific Public IP Address
in using my FTP what will be the rules that i should  apply?

I was thinking of setting up a rule that will filter incomming Public IP
Address request for ftp before it forwards it into my internal FTP Server.

Below are the sample entry in my iptables:
iptables -t filter -A INPUT -p tcp -s $PublicIPAdd --dport 20:21 -j ACCEPT
<--- is this correct?
iptables -t filter -A INPUT -j DROP

Below are the previous solution that you gave.

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

Thanks in advance!
Milo

----- Original Message -----
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, December 29, 2004 01:30 AM
Subject: Re: FTP Forwarding


> On Tue, 2004-12-28 at 12:19, umar draz wrote:
> > Hi Dear Members!
> >
> >   i have linux machine which configured as a router
> >
> >   my linux router has 2 NIC one with Public ip 202.147.167.99 and other
is local ip 192.168.0.1
> >   i have a another linux machine which configured as a FTP server and
that machine ip is 192.168.0.5. Now i want my this ftp server can be access
all world. so what kind of iptables rules will be add on linux router that
if some one want to access ftp 202.147.167.99 its automaticaly forward or
redirect my local machine 192.168.0.5.
> >
> >  Please help me in this regard
> >
> > Thanks
> >
> > Umar
>
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
>
> iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d 202.147.167.99 \
>   --dport 21 -j DNAT --to-destination 192.168.0.5
>
> iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d 192.168.0.5 \
>   --dport 21 -j ACCEPT
>
> the above assumes you have a rule in FORWARD that accepts established
> packets, such as:
>
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> hth...
>
> -j
>
> --
> "Well, I'm tired of being a wannabe league bowler. I wanna be a
>  league bowler!"
> --The Simpsons
>
>


