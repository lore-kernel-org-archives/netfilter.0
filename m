From: Krunk <krunkalot@hotpop.com>
Subject: Re: passive ftp
Date: Sat, 17 Apr 2004 13:12:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082225524.4221.9.camel@james>
References: <web-287943006@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-287943006@mail01.infosat.net>
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

This did it for me:
IPT=/usr/sbin/iptables
EXTIF=ppp0 # interface facing outward
EXTIP=xxx.xxx.xxx.xxx
INTIF=eth1
INTNET=<ip assigned to eth1>
TCP="ftp ftp-data"
for i in $TCP
do
$IPT -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --dport $i --syn -m state --state NEW -j ACCEPT
$IPT -A FORWARD -i $INTIF -p tcp -s $INTNET --dport $i --syn -m state --state NEW -j ACCEPT
done

You can put any number of services defined in /etc/services in the TCP
list and free them up with the loop. 

On Sat, 2004-04-17 at 12:50, IT Clown wrote:
> Hi 
> 
> I am having some trouble to access passive mode ftp sites.I
> have a firewall with ip forwarding enabled.When a pc on the
> network want to access passive ftp servers i need to do the
> following in my rules ( on the server ):
> 
> -A OUTPUT -p tcp -m multiport --dport 21,20 -j ACCEPT
> -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> -A FORWARD -i eth0 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> But i do not want every query to be forwarded i only want
> say ftp access to be forwarded. Why does the following not
> work ( on the server ):
> 
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 20 -j ACCEPT
> -A FORWARD -p tcp -i eth0 -o ppp0 --dport 21 -j ACCEPT
> -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> Regards
> ______________________________________________________________
> Herbalife Independent Distributor http://www.healthiest.co.za



