From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP rules
Date: Mon, 31 Jan 2005 11:41:38 -0500
Message-ID: <20050131164138.GA25132@bender.817west.com>
References: <web-42708298@infinito.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <web-42708298@infinito.it>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jan 31, 2005 at 05:40:24PM +0100, hamals@infinito.it wrote:
> 
>  my PCs behind my firewall didn't get ftp connection to 
> any external ftp server. Why?
> 
> /sbin/modprobe ip_contrack
> /sbin/modprobe ip_contrack_ftp

how about this as well:

  /sbin/modprobe ip_nat_ftp

> # LAN -> INTERNET
> iptables -A FORWARD -i $LAN -o $INET -p tcp --dport 21 -j 
> ACCEPT
> iptables -A FORWARD -i $LAN -o $INET -p tcp --dport 20 -j 
> ACCEPT

second rule is unnecessary.

> # INTERNET ->LAN
> iptables - A FORWARD -i $INET -o $LAN -p tcp -m state 
> --state ESTABLISHED, RELATED -j ACCEPT

you need to allow ESTABLISHED,RELATED packets from LAN -> INTERNET as
well, try using:

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

instead of your rule above.

> # NAT
> iptables -t nat -A POSTROUTING -s $IPs_LAN -o $INET -j 
> SNAT  --to-source $INET_IP

-j

--
"My cat's breath smells like cat food."
        --The Simpsons

