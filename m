From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: RE: natting specific ports
Date: Fri, 13 Dec 2002 09:57:34 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c2a2d1$1e14cf20$0100a8c0@zultys.com>
References: <CAFAAEC91CC8D511952000062938C6F12ECDC0@ozlan.fcdomain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <CAFAAEC91CC8D511952000062938C6F12ECDC0@ozlan.fcdomain.net>
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


Hi Doug,

Do you want to NAT for traffic coming in or for traffic going out ?

If you want your internal network to be able to reach external telnet
and smtp servers, then your destination port will be 23 or 25, not your
source port.

If you want to host telnet and smtp servers behind a firewall and allow
only NATted access to these servers, then you should be using DNAT, not
SNAT.

Hope this helps,

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
771 Vaqueros Avenue
Sunnyvale  CA  94085
USA
Ranjeet.Shetye@Zultys.com
http://www.zultys.com/

 


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Simpson, Doug
> Sent: Friday, December 13, 2002 9:49 AM
> To: 'netfilter@lists.netfilter.org'
> Subject: natting specific ports
> 
> 
> I want to "NAT" just specific ports to my Public IP.  Do the 
> commands below make sense?  I want my internal network to be 
> able to telnet and send email. (eth0 is my External NIC - it 
> is exposed to the internet) 
> iptables -t nat -A POSTROUTING -p tcp --sport 25 -o eth0 -s 
> $INTERNAL_IP -j SNAT --to $EXTERNAL_IP iptables -t nat -A 
> POSTROUTING -p tcp --sport 23 -o eth0 -s $INTERNAL_IP -j SNAT 
> --to $EXTERNAL_IP
> 
> Thank you,
> Doug
> 



