From: Snehasis Sinha <ssinha@connectivasystems.com>
Subject: RE: iptables - port forwarding in LAN
Date: Tue, 19 Sep 2006 09:26:37 +0530
Message-ID: <450F6A75.10103@connectivasystems.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



-------- Original Message --------
Subject: 	[?] RE: iptables - port forwarding in LAN
Date: 	Mon, 18 Sep 2006 17:13:39 +0200
From: 	Sietse van Zanen <sietse@wizdom.nu>
To: 	Snehasis Sinha <ssinha@connectivasystems.com>
References: 	<4504CC74.3040607@mailinator.com> 
<Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu> 
<450AD4EE.3050205@mailinator.com> <450AD69F.9000506@candlefire.org> 
<450AD8D4.7040008@mailinator.com>, <450E8D0F.2070909@connectivasystems.com>



You will have to pull of quite some tricks to make that work, as all 
your hosts are on the same subnet. This is what happens when you just 
try NAT:
 
1. host_c contacts host_a on port 80.
2. host_a NATs this to host_b port 8080
3. host_b receives the connection, thinking it comes from host_a 
directly (source IP remains the same)
4. host_b replies to host_a with a SYN_ACK for port 8080
5. host_a recieves the syn_ack for host_b port 8080 and rejects this, as 
it never tried openeing a connection to that host on that port.
 
To get this to work you will have to double NAT (both NAT source and 
destination address). Change the destination address from host_a port 80 
to host_b port 8080 and MASQUERADE the source address. That way host_b 
will think the connection comes from host_a and replies accordingly. 
host_a then NATs all back to host_c.
 
Should be something like:
iptables -t NAT -A PREROUTING -s 10.5.1.150 -d 10.5.1.100 --dport 80 -j 
DNAT --to-destination 10.5.1.200:8080
iptables -t NAT -A POSTROUTING -s 10.5.1.150 -d 10.5.1.200 --dport 8080 
-j SNAT --to-source 10.5.1.150
 
for testing, set the filter tables policies to ACCEPT, so only NAT is 
used. Apply only the previous NAT rules to the nat table.
 
-Sietse
 
PS: Could you forward this message to the list. I cannot send it there, 
as I'm using OWA, which is HTML only and the list only accepts clear text.
 

------------------------------------------------------------------------
*From:* Snehasis Sinha
*Sent:* Mon 18-Sep-06 14:11
*To:* netfilter@lists.netfilter.org
*Subject:* iptables - port forwarding in LAN

Hi,

I am trying to port forward in a closed (not connected to real internet or outside network) network (LAN) to a machine; but could not do it successfully. the senerio is:

I have a host_a (10.5.1.100), host_b (10.5.1.200) and host_c (10.5.1.150) connected among themselves. from host_c i am accessing http service at host_a using http://10.5.1.100:80. I can access tomcat server using http://10.5.1.200:8080, from host_c. now I want to use http://10.5.1.100:80 to access 10.5.1.200:8080 from the same host (host_c), ie. all http requests targetted to 10.5.1.100:80 should be redirected to 10.5.1.200:8080, so that pages from host_b:8080 comes to host_c but appear to come from host_a:80

how to do that using iptables. please advise.
thanks in advance

-snehasis

