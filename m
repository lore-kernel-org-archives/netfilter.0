From: Jonas Meurer <jonas@freesources.org>
Subject: Re: how to set ports for ip_conntrack_ftp
Date: Sun, 3 Sep 2006 18:29:26 +0200
Message-ID: <20060903162926.GA4573@freesources.org>
References: <20060831151130.GA32342@freesources.org>
	<000601c6cd14$e07a28a0$0101000a@tanjian>
	<20060831155749.GC32342@freesources.org>
	<44F711D4.5090002@plouf.fr.eu.org>
	<20060901012054.GB23094@freesources.org>
	<44F7996C.9010504@plouf.fr.eu.org>
	<20060902142712.GA31352@freesources.org>
	<44F9A071.7070603@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44F9A071.7070603@plouf.fr.eu.org>
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

On 02/09/2006 Pascal Hambourg wrote:
> >>>>What do the "-d **.**.***.**/31" address ranges represent ?
> >
> >the ftp servers listen on both ips. so both are server addresses.
> >
> >do you think that i should change the "-d ..." at -A OUTPUT to "-s ..."?
> 
> Obviously yes. I just wonder how these rules could accept the control 
> connection, as they did not accept the return packets from the server.

i guess that it was a typo in my previous mail. the rules on the server
used -s for -A OUTPUT  all the time.

> [...]
> >i would like to support both active and passive mode.
> 
> To allow active mode you'll have to perform two actions :
> 
> 1) Look into your FTP server configuration for an option named "passive 
> mode local port range" or the like. You must define a port range that is 
> not likely to be used by other local processes (so for example don't 
> overlap /proc/sys/net/ipv4/ip_local_port_range). The number of ports in 
> the interval must be bigger enough than the expected maximum number of 
> simultaneous data connections from FTP clients.

this is a big problem, as the ftp-server does not seem to support any
other configuration than ip and port to listen on. it's the internal
zope ftp-server (Medusa Async V1.23 [experimental]).

> 2) Set iptables rules in INPUT and OUTPUT which allow incoming TCP 
> connections to the port range you defined in the previous step.
> 
> [...]
> 
> I guess your ruleset does not allow incoming TCP connections to the port 
> 46316, so the data connection fails. Don't bother to allow this port, as 
> it is dynamic and a different one is chosen by the server for each 
> passive data connection.
> 
> [...]
> 
> That's probably the effect of the -d option in the second OUTPUT rule. 
> The server tries to open a data connection to the TCP port 50547 of 
> 192.168.3.34, but this destination address doesn't match the -d option. 
> Try to change -d to -s. Check also that there is no packet filter on the 
> client which may block FTP data connections.

now i used the following rules:
iptables -A INPUT -i eth0 -m state --state NEW,ESTABLISHED \
  -m multiport -p tcp --dports 9621,9721 -d 62.75.128.98/31 -j ACCEPT
iptables -A OUTPUT -o eth0 -m state --state ESTABLISHED \
  -m multiport -p tcp --sports 9621,9721 -s 62.75.128.98/31 -j ACCEPT
iptables -A INPUT -i eth0 -m state --state ESTABLISHED \
  -m multiport -p tcp --dports 9620,9720 -d 62.75.128.98/31 -j ACCEPT
iptables -A OUTPUT -o eth0 -m state --state NEW,ESTABLISHED \
  -m multiport -p tcp --sports 9620,9720 -s 62.75.128.98/31 -j ACCEPT

unfortunately i still get the same result, both with passive and active
ftp.
i understand why passive ftp doesn't work, the ports are simply not open
for the passive connection. but why does active ftp still not work? i
tried from different servers without firewall and without a nat router,
so the client cannot be the problem at all.

do you have any further suggestions?

it would be great to get at least active ftp working.

...
 jonas

