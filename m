From: Vilmos Branyik <vbranyik@piopc.com>
Subject: RE: Forward UDP broadcast
Date: Mon, 2 Jun 2003 23:31:34 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <30E7B49F378ED711AC0F00E02917CD8B0DA8@POLLY>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: Rommy Taslim [mailto:rommyt@transportservices.com.au]
> Sent: Monday, June 02, 2003 11:29 PM
> To: netfilter@lists.netfilter.org
> Subject: Forward UDP broadcast
> 
> 
> Hi,
> 
> Anyone knows how to forward UDP broadcast using iptables ?
> I need to do something like ipportfw does:
> ipportfw -A -u 192.168.4.255/699 -R 192.168.2.255/699
> 
> which forward all the broadcast on network 4 for port 699 to 
> network 2.
> 
> I have something like this for iptables:
> 
> iptables -t nat -A PREROUTING -p udp \
>         -d 192.168.4.255 --dport 699 \
>         --to-destination 192.168.2.255:699
> 
> But it didn't work.
> 
> Anyone can give me some pointers ??
> 
> Thanks in advance.
> 
> Rommy

This works for me:
EXTIP=External IP address
PORTFWIP=IP address to forward to

# Service at port 645 udp
$IPTABLES -A FORWARD -i eth0 -o eth1 -p udp --dport 645 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -p udp -d $EXTIP --dport 645 \
  -j DNAT --to $PORTFWIP:645

Vilmos

