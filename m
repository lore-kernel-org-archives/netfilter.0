From: "Jesper Lund" <jesper@ballbreaker.dk>
Subject: Re: Redirect DHCP requests to DMZ?
Date: Wed, 23 Apr 2003 19:58:11 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4683.212.242.51.102.1051120691.squirrel@www.ramstedt.dk>
References: <3EA66634.2020508@blinkenlichten.de> 
     <1051100353.12295.96.camel@elendil.intranet.cartel-securite.net> 
     <3EA6C622.3020103@blinkenlichten.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EA6C622.3020103@blinkenlichten.de>
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
To: Carsten Maass <cm@blinkenlichten.de>
Cc: netfilter@lists.netfilter.org

> This is exactly what I dont understand: What are they? After all they
> are just IP packets. And if I am able to apply to them a rule like
>
> $IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255
> --destination-port 67:68 -j DROP
>
> which discards them, why am I unable to apply a rule which redirects
> them to another subnets interface? Shouldn't the DNAT thingy take care
> of the new destination address?

If you DNAT the DHCP request, the destination IP is not an broadcast
anymore. And because of that, the DHCP server will not recognize it as a
DHCP request.

//Jesper

