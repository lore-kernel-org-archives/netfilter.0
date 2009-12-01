From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: FTP port mode, client and server behind iptables
Date: Tue, 01 Dec 2009 09:44:36 +0100
Message-ID: <4B14D774.5070605@chello.at>
References: <034DEBCAE934A74991E6E76B8DA72D14185DD50B01@HSSBS.holdstead.local>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D14185DD50B01@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Gary Smith wrote:
> As per the subject, I have a proftp server running behind iptables.  I'm NAT'ing in the entire IP to the ftp server.  
>
> I have the following rules in place on the server (where eth0 is internal, eth1 is external):
> *nat
> -A PREROUTING -d x.x.x.x -p tcp -m tcp -j DNAT --to-destination 10.20.0.12
> *filter
> -A FORWARD -d 10.20.0.12 -i eth1 -p tcp -m tcp --dport 1025:65535 -j ACCEPT 
>   

> -A FORWARD -d 10.20.0.12 -i eth1 -p tcp -m tcp -m multiport --dports 80,443,21,20,22 -j ACCEPT
> -A FORWARD -j LOG --log-prefix "FW-F: " 
> -A FORWARD -i eth1 -j REJECT --reject-with icmp-port-unreachable
> ip_conntrack_ftp and ip_nat_ftp are loaded
>
> On the client side (where eth0 is internal, eth1 is external), 
> -A FORWARD -I eth0 -j ACCEPT 
> -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
> -A FORWARD -j LOG --log-prefix "FW-F: " 
> -A FORWARD -i eth1 -j REJECT --reject-with icmp-port-unreachable
> ip_conntrack_ftp and ip_nat_ftp are loaded
>
> I'm not seeing any hits in the log file (which logs on each chain before reject).
>
> Anyway, what am I missing for PORT mode for FTP.  The windows command line users seem to be the only ones affected by this (as pretty much everything else allows passive).
>
>   

Port mode does not exist, there are passive and active mode in FTP, both 
use ports, but different ones....

> Any ideas?
>   

Umm, quite some... my proposal:

# allow all established and related (most expected hits -> rule placed first)
-A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# allow ftp: only for host or globally
-A FORWARD -i eth0 -d 10.20.0.12 -m helper --helper "ftp" -j ACCEPT
-A FORWARD -i eth1 -s 10.20.0.12 -m helper --helper "ftp" -j ACCEPT
--or more global: -A FORWARD -m helper --helper "ftp" -j ACCEPT


# allow connection openings (last rule as not more than a few packets per connection are state NEW)
-A FORWARD -d 10.20.0.12 -i eth1 -p tcp -m tcp -m multiport --dports 80,443,21,22 -m conntrack --ctstate NEW -j ACCEPT
-A FORWARD -i eth1 -j REJECT....... 

regards

Mart
