From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Forwarding
Date: Fri, 14 Jan 2005 09:23:44 -0500
Message-ID: <1105712624.3661.19.camel@hubcap.ljm.dom>
References: <20041228171949.35308.qmail@web53109.mail.yahoo.com>
	<1104255053.7318.28.camel@hubcap.ljm.dom>
	<001301c4fa17$03de2b20$0200a8c0@etpi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001301c4fa17$03de2b20$0200a8c0@etpi>
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

On Fri, 2005-01-14 at 03:57, Test Mail wrote:
> Hi!Can i have a follow up question regarding FTP server inside internal LAN
> which can be seen in the internet.....
> now what if the scenario is i want to restrict a specific Public IP Address
> in using my FTP what will be the rules that i should  apply?
> 
> I was thinking of setting up a rule that will filter incomming Public IP
> Address request for ftp before it forwards it into my internal FTP Server.
> 
> Below are the sample entry in my iptables:
> iptables -t filter -A INPUT -p tcp -s $PublicIPAdd --dport 20:21 -j ACCEPT
> <--- is this correct?
> iptables -t filter -A INPUT -j DROP
> 
> Below are the previous solution that you gave.
> 
> modprobe ip_conntrack_ftp
> modprobe ip_nat_ftp
> 
>  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp -d 202.147.167.99 \
>    --dport 21 -j DNAT --to-destination 192.168.0.5
> 
>  iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d 192.168.0.5 \
>    --dport 21 -j ACCEPT

change that rule to something like:

  iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn \
    -s $PublicIPAdd -d 192.168.0.5 --dport 21 -j ACCEPT

repeat for multiple instances of $PublicIPAdd.

-j

--
"It's not easy to juggle a pregnant wife and a troubled child, but
 somehow I managed to fit in eight hours of TV a day."
	--The Simpsons


