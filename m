From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: port forwarding in a web server
Date: Wed, 26 Nov 2003 10:24:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311261527.hAQFRkAm029339@discmail.com>
References: <1069689909.1083.13.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069689909.1083.13.camel@webmail.aeropostal.com.ve>
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
To: 'Juan Hernandez' <hvjuan@kanux.com>, 'Lista de netfilter' <netfilter@lists.netfilter.org>

" it's just not forwarding anything"

Add FORWARD rules -d 192.168.0.1 -j ACCEPT

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Juan Hernandez
Sent: Monday, November 24, 2003 11:05 AM
To: Lista de netfilter

Hi there...

   This may have been answered many times in this mailing list but I
haven't found anything on the web about something that would make my
server forward the way I want to, and what's ironic is that it seems
simple. Here's my scenario: I have a static IP address routed (1.1.1.1)
to one server using a 192.168.0.* address. Is a cisco router and
everything works fine. This server has 192.168.0.1 as it's address and
functions as a web server, everything works fine but, I have another
server that works as our mail server that is using 192.168.0.2. I've
been trying to redirect everything coming from port 25 to my mail server
but it doesn't get any answer. These are the rules I've been using: 

echo 1 > /proc/sys/net/ipv4/ip_forward

modprobe iptable_nat

#allow all outgoing traffic from the mail server 

iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to 192.168.0.1

#dnat
iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth0 -j DNAT --to
192.168.0.1:25

The gateway on the mailserver is 192.168.0.1 which is the webserver that
it's forwarding everything... and I have tried so many things that
sometimes the webserver stops working...

Using that configuration, if I nmap the webserver it shows that tport 25
is filtered but, if i telnet to taht port I wont get any response... and
the mailserver is running perfectly, it's just not forwarding anything

Any suggestions would be appreciated...

Thanks a lot for your time

Juan






