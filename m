From: Pablo Allietti <pablo@lacnic.net>
Subject: Re: dnat problem
Date: Tue, 25 Jan 2005 12:24:31 -0300
Message-ID: <20050125152431.GA27029@omega.lacnic.net.uy>
References: <20050122155935.GA20433@omega.lacnic.net.uy>
	<1106423137.4779.6.camel@hubcap.ljm.dom>
	<20050123002641.GA32546@omega.lacnic.net.uy>
	<20050125150114.GA25839@omega.lacnic.net.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050125150114.GA25839@omega.lacnic.net.uy>
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
Cc: netfilter@lists.netfilter.org

On Tue, Jan 25, 2005 at 12:01:14PM -0300, Pablo Allietti wrote:
> On Sat, Jan 22, 2005 at 09:26:41PM -0300, Pablo Allietti wrote:
> > On Sat, Jan 22, 2005 at 02:45:37PM -0500, Jason Opperisano wrote:
> > > On Sat, 2005-01-22 at 10:59, Pablo Allietti wrote:
> > > > hi all
> > > > 
a


sorry for duplicate jason. i sent to you and is for the list sorry :)

> 
 i continue with my problem! :(
 
 iptables -A FORWARD -o eth0 -i eth1 -p tcp -m state --state ESTABLISHED
 
 iptables -A FORWARD -j ACCEPT -p tcp --dport 1246
 iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 1246 -j DNAT --to
 192.168.1.143:22
 
 i have this but i cant connecto to server 192.1698.1.143 from the
 outside.  i do
 
 ssh -p 1246 200.20.43.2 
 
 but nothing happends.
 
 i miss some rule ?



my rules Chain PREROUTING (policy ACCEPT 2772 packets, 1314190 bytes)
    pkts      bytes target     prot opt in     out     source
destination         

Chain INPUT (policy ACCEPT 704 packets, 101110 bytes)
    pkts      bytes target     prot opt in     out     source
destination         

Chain FORWARD (policy ACCEPT 2060 packets, 1212664 bytes)
    pkts      bytes target     prot opt in     out     source
destination         

Chain OUTPUT (policy ACCEPT 549 packets, 78617 bytes)
    pkts      bytes target     prot opt in     out     source
destination         

Chain POSTROUTING (policy ACCEPT 2617 packets, 1291697 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
Chain PREROUTING (policy ACCEPT 2719 packets, 241128 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
       0        0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:1246 to:192.168.1.143:22 
       0        0 DNAT       tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:247 to:192.168.1.79:22 
      36     1712 DNAT       icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0           to:192.168.1.143 
       0        0 DNAT       tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:3306 to:192.168.1.143 

Chain POSTROUTING (policy ACCEPT 840 packets, 69211 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
     403    29588 SNAT       all  --  *      *       192.168.1.0/24
0.0.0.0/0           to:200.40.228.66 

Chain OUTPUT (policy ACCEPT 906 packets, 82037 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
Chain INPUT (policy DROP 2 packets, 192 bytes)
    pkts      bytes target     prot opt in     out     source
destination         
    3175   660254 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0           
    3585   555905 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED 
       1       40 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:21 flags:0x16/0x02 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22 
      47     2788 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25 flags:0x16/0x02 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:53 
      78     5476 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           udp dpt:53 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:80 flags:0x16/0x02 
      37     1776 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:110 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:143 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:443 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:953 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:995 




> 
> 
> 
> 
> 
> 
> > > > i have a problem with dnat i have this struc.
> > > > 
> > > > 
> > > > 		|
> > > > 		|internet
> > > > 		|
> > > > 		Firewall 200.20.43.2
> > > > 		|
> > > > 		|
> > > > 		|
> > > > 		Server 192.168.1.143
> > > > 
> > > > 
> > > > and i have this rule in the firewall.
> > > > 
> > > > iptables  -t nat -A PREROUTING -i eth0 -p tcp --dport 2244  -j DNAT
> > > > --to-destination 192.168.1.143:22
> > 
> > thanks that is the solution.! :)    jaja nice signature.! Homer say
> > that.. i love homer
> > 
> > 
> > > > 
> > > > i supouse this rule make a dnat to server 192.... to ssh but nothing
> > > > happends
> > > > 
> > > > i do ssh -p2244 200.20.43.2  but nothing respond
> > > > 
> > > > what i miss ? :(
> > > 
> > > and you have a FORWARD rule that looks like:
> > > 
> > >   iptables -A FORWARD -i eth0 -p tcp -d 192.168.1.143 --dport 22 \
> > >     -j ACCEPT
> > > 
> > > yes?
> > > 
> > > -j
> > > 
> > > --
> > > "Kids, you tried your best and you failed miserably. The lesson is,
> > >  never try."
> > > 	--The Simpsons
> > > 
> > ---end quoted text---
> > 
> > -- 
> > 
> > 
> > Pablo Allietti
> > LACNIC
> > --------------
> > 
> ---end quoted text---
> 
> -- 
> 
> 
> Pablo Allietti
> LACNIC
> --------------
> 
---end quoted text---

-- 


Pablo Allietti
LACNIC
--------------


