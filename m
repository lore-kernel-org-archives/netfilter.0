From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 17:00:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121700.13102.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <1065994862.3562.10.camel@Marvin> <200310121604.06545.Herman@AerospaceSoftware.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121604.06545.Herman@AerospaceSoftware.com>
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
To: netfilter@lists.netfilter.org

Hi guys,

Well, I now downgraded to netfilter version 1.2.5-1 and the complaints went 
away, though I still haven't gotten forwarding to work and this is the 
version where I last had it working - sigh...

Here is my problem:
I need to forward a port from outside the firewall, to everybody on the 
inside.  All examples I have seen forwards to a specific IP on the inside, 
which doesn't go well with DHCP.  The man page says that specifying a range 
of IPs will trigger a round robin effect, which I don't think I want to 
happen. So, how now brown cow?

I'm testing this with the Nectarine Demoscene radio station and xmms, since 
that is way easier than messing with the government services that I actually 
need this for. Nectarine needs port 8002 to be forwarded.  On the server, it 
works and the address to put into xmms is http://130.231.60.129:8002/

On my laptop, I can't get it to work, though I had it working a couple of 
months ago, with these firewall rules:
echo "   DNAT Forward port 8002 for Nectarine Demoscene Radio"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 8002 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8002 -j DNAT --to 
192.168.10.245:8002

If I display the rules, I can't see any forwarding rules in the list, which 
tells me that the forwarding rules that I try to implement are simply ignored 
by iptables:

iptables -v -L
Chain INPUT (policy ACCEPT 55251 packets, 13M bytes)
 pkts bytes target     prot opt in     out     source               
destination
    2    96 DROP       all  --  any    any     d142-59-155-57.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     
s142-59-150-199.ab.hsia.telus.net  anywhere
    3   188 DROP       all  --  any    any     
d142-59-172-230.abhsia.telus.net  anywhere
    2    96 DROP       all  --  any    any     d142-59-59-12.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     
d142-59-162-102.abhsia.telus.net  anywhere
    2    96 DROP       all  --  any    any     
d142-59-176-107.abhsia.telus.net  anywhere
    1    64 DROP       all  --  any    any     d142-59-78-76.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     d142-59-80-67.abhsia.telus.net  
anywhere
    1    48 DROP       all  --  any    any     
d142-59-152-127.abhsia.telus.net  anywhere
    2    96 DROP       all  --  any    any     142.59.143.156       anywhere
    2   128 DROP       all  --  any    any     142.59.137.22        anywhere
    0     0 DROP       all  --  any    any     d142-59-63-31.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     142.59.141.9         anywhere
    2    96 DROP       all  --  any    any     142.59.143.244       anywhere
    0     0 DROP       all  --  any    any     d142-59-10-57.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     
d142-59-216-157.abhsia.telus.net  anywhere
    2    96 DROP       all  --  any    any     alik57zgy55og.ab.hsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     d142-59-95-82.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     
d142-59-225-188.abhsia.telus.net  anywhere
    2    96 DROP       all  --  any    any     trialserver.americoac.com  
anywhere
    2    96 DROP       all  --  any    any     142.59.137.249       anywhere
    2    96 DROP       all  --  any    any     d142-59-144-7.abhsia.telus.net  
anywhere
    1    48 DROP       all  --  any    any     d142-59-81-170.abhsia.telus.net  
anywhere
    2    96 DROP       all  --  any    any     a6jp39qoy31v4.ab.hsia.telus.net  
anywhere

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 56800 packets, 63M bytes)
 pkts bytes target     prot opt in     out     source               
destination

--
How can the FORWARD chain be empty, since MASQUERADE is working and my laptop 
can surf the web?
Why are my new forwarding rules ignored?
How can I debug this stuff and see where the packets are going/not going?
Can anybody shed light on this?

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

