From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 08:17:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401070817.38685.danielf@supportteam.net>
References: <83055D4B014C9E478D2F04624B9E82CFAE965A@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFAE965A@noveldc.novelgmt.mu>
Content-Disposition: inline
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
To: Gilles Yue <gyue@novelgmt.intnet.mu>, netfilter@lists.netfilter.org

try

$IPTABLES -A INPUT -p udp --dport 161 -j ACCEPT 

assuming that yuo are tryinh to accept port 161 on the local machine. if you 
doing stateful it should look similar to this. 

# IP of machine running MRTG
$SNMP_POLLER_IP="xxx.xxx.xxx.xxx"

$IPTABLES -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 161 -m state --state NEW -s $SNMP_POLLER_IP 
-j ACCEPT

$IPTABLES -A OUTPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -p udp --sport 161 -m state --state NEW -s $SNMP_POLLER_IP 
-j ACCEPT

This is assuming you have set the ploicies to drop
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP

On Wednesday 07 January 2004 06:46, Gilles Yue wrote:
> Hi,
>
> Is this the way it should be in iptables?
>
> #Open SNMP Ports
> $IPTABLES -A INPUT -p udp -m udp --dport 161 -j ACCEPT
>
> Have tried it, not working
>
> Thanks.
> Gy
>
> -----Original Message-----
> From: Daniel F. Chief Security Engineer -
> [mailto:danielf@supportteam.net]
> Sent: Wednesday, January 07, 2004 4:45 PM
> To: Gilles Yue; netfilter@lists.netfilter.org
> Subject: Re: MRTG and IPTABLES
>
> SNMP UDP Ports 161 and 162 MRTG typically only uses 161.
>
>
> Thanks
>
> On Wednesday 07 January 2004 00:54, Gilles Yue wrote:
> > MRTG cannot work properly due to iptables running.
> >
> >
> >
> > Anybody knows which port number to open to enable MRTG to work
>
> properly.
>
> > Thanks.
> >
> >
> >
> > Rgds
> >
> > gy

-- 
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
The distance between nothing and infinity is always the same no matter how 
close you get to nothing.

