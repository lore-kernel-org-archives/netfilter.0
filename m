From: "Chris Frederick" <cdf123@cdf123.com>
Subject: Re: iptables port forwarding not working
Date: Fri, 27 Jun 2003 14:08:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFC9618.5070706@cdf123.com>
References: <3EFC878D.50304@cdf123.com> <20030627183259.GE11167@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030627183259.GE11167@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Ramin Dousti wrote:

>On Fri, Jun 27, 2003 at 01:06:05PM -0500, Chris Frederick wrote:
>
>  
>
>>I need some help with an iptables script.  I'm trying to forward port 80 
>>on the Firewall/NAT/Router to another machine inside the firewall.  I've 
>>googled for some scripts and found the PREROUTING lines that are needed, 
>>but it doesn't seem to work.  The port isn't open on the machine.  I've 
>>attached a sample script bellow that sums up what I'm doing.  Any 
>>sugestions?
>>
>>INET_IP="1.1.1.1"
>>INET_IFACE="eth1"
>>INET_BROADCAST="1.1.1..255"
>>
>>LAN_IP="2.2.2.2"
>>LAN_IP_RANGE="2.2.2.0/24"
>>LAN_BROADCAST_ADDRESS="2.2.2.255"
>>LAN_IFACE="eth0"
>>
>>LO_IFACE="lo"
>>LO_IP="127.0.0.1"
>>
>>DNAT_IP_PORT="2.2.2.3:80"
>>
>>#Forward the HTTP trafice from the net to the server at 2.2.2.3
>>$IPTABLES -t nat -A PREROUTING -p tcp -i $INET_IFACE -d $INET_IP --dport 
>>80 -j DNAT --to $DNAT_IP_PORT
>>$IPTABLES -A FORWARD -p tcp -i $INET_IFACE -d $INET_IP --dport 80 -j ACCEPT
>>    
>>
>
>In PREROUTING you change the dst to 2.2.2.3 but in the forward you allow
>1.1.1.1. This is at least one problem you have in your script.
>
>You also say that you get the indication of the port not being open on the
>machine. How do you assert this statement?
>
>  
>
>>On a side note, once I get this working, I'm planning on forwarding
>>HTTPS to another machine, and also forwarding SSH on a non-standard port
>>to another machine (e.g.  port 999 to 22).  Are there any issues with
>>doing this?  Like, say the HTTPS or SSH certs looking like they're
>>comming from a different ip and causing errors trying to connect?  Or
>>will I get key change errors from the server (since I connect to SSH on
>>22 and 999 on the same ip) every time I connect to the other one?   Or
>>am I overthinking this, and it all just works?
>>    
>>
>
>
>ssh will not have a problem but https will, because of the issued cert...
>
>Ramin
>
>
>  
>
I'm running  SuperScan 3.00 on a Windows 2000 box and scanning all ports 
1-1000 to test the firewall.

Are you saying to change the:
$IPTABLES -A FORWARD -p tcp -i $INET_IFACE -d $INET_IP --dport 80 -j ACCEPT
to:
$IPTABLES -A FORWARD -p tcp -d 2.2.2.3 --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -s 2.2.2.3 --sport 80 -j ACCEPT
or do both?  Or did I miss the point?

If a packet was forwarded to the new destination correctly, but the 
reply couldn't get through (due to the error you pointed out), would 
that show up as a closed port on the scanner?  That would explain why 
it's not showing as open.  When I get home I'll test it again with 
tcpdump and nmap.

And for the https, couldn't I use a cert made for the router(2.2.2.2) on 
ther apache server(2.2.2.3), and fool the client browsers to think that 
they're the same machine?  This is only for a test environment, so if 
the cleints testing it get invalid cert errors it's no big deal.

Thanks for the info, I'm gona read up on the FORWARD rules a bit more. 
 I think I misunderstood how they worked.

Chris Frederick



