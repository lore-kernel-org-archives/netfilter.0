From: Jonathan G - Mailing List <email-lists@surestorm.com>
Subject: Re: load-balancing with netfilter: round robin or what??
Date: Mon, 06 Oct 2003 13:23:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F81509E.3080600@surestorm.com>
References: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
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
To: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>, netfilter@lists.netfilter.org

Hi pedro / Hola pedro,

what do you want? LB for firewalls or LB for web servers? I didn't 
understand your question.

If the reality is that you need a load balancing of web servers you may 
deploy easy dns round robin. this could be easy to configure but a bad 
idea for high information volume.

If you prefer you may implement HA (high availability) with a master and 
a slave box. With this config one of your server will ask connections 
until it falls, then the second box will answer connections to the 
moment tha first comes up. This is the most used implementation to give 
continuosuly service.

I have deployed in many installations this configuration for firewalls. 
I have used VRRP (virtual redundancy routing protocol) on nokia boxes 
for CheckPoint Firewall-1 clusters and works fine. You may use the same 
idea installing the vrrpd daemon in the www boxes. Could run fine.

If you don't know how vrrp works, it implements a virtual mac and a 
virtual ip, so form iptables you only have to forward traffic to the 
virual ip. The machine that is up will take the connection and will 
server the pages.

Best regards,

jonathan



Pedro Salazar wrote:
> Greetings,
> 
> I pretend to load-balancing to two servers but apparently I think only
> one machine is getting the requests.
> 
> These are the rules I run in iptables:
> 
> /sbin/iptables -v -P INPUT ACCEPT
> /sbin/iptables -v -P OUTPUT ACCEPT
> /sbin/iptables -v -P FORWARD ACCEPT
> /sbin/iptables -v -t nat -A PREROUTING --dst 192.168.89.44 -p tcp \
>  --dport 9000 -j DNAT --to-destination 192.168.89.158:80 \
>  --to-destination 192.168.89.159:80
> /sbin/iptables -v -t nat -A POSTROUTING --dst 192.168.89.158/31 \ 
> -p tcp --dport 80 -j SNAT --to-source 192.168.89.44
> /sbin/iptables -v -t nat -A OUTPUT -p tcp -m tcp --dport 9000 \ 
> --dst 192.168.89.44 -j DNAT --to-destination 192.168.89.158:80 \
>  --to-destination 192.168.89.159:80
> 
> As you can see, I have two destinations hosts, 192.168.89.158/31. The
> 192.168.89.44 is the gateway itself that is redirecting requests on port
> 9000 to the two http servers. All of them are in the same network.
> 
> However, I think only the .158 is getting the requests (I have verified
> that with tcpdump).
> 
> So, what is wrong or what is needed? I supposed the requests would be
> load-balanced...
> 
> I'm using a linux redhat 7.3 box with default kernel 2.4.18-3. 
> 
> thanks,
> Pedro Salazar.

-- 
__________________________________________________________________
Jonathan Gonzalez - SureStorm.com Security Site - Madrid/MA/SPAIN
http://www.surestorm.com -  GnuPG Key ID = 0xAA3EAC08

/"\
\ /  ASCII RIBBON CAMPAIGN
  X   Against HTML mail & Microsoft attachments
/ \


