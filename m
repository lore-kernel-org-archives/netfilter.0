From: Robert Botha <flash@flash.za.org>
Subject: Re: (no subject)
Date: Mon, 9 Sep 2002 13:13:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909111307.GB16618@flash.za.org>
References: <000201c25717$ce09ac80$0201a8c0@Operator>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000201c25717$ce09ac80$0201a8c0@Operator>
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
To: saki <saki@sunsilk.econet-cyber.com>
Cc: netfilter@lists.samba.org

Do you need it to map like that..or do you just want to do load
balancing over the 16 ips ?
If you just need load balancing, then this command will do:

iptables -t nat -I POSTROUTING -s 192.168.1.0/26 \
 -j SNAT --to 202.47.12.30-202.47.12.45


oh.. /26 is 64ips..but it's the closest to 50 you can get in one line

Are you using a class C netmask? if so..then just use /24 :)

-Robert.

On Wed, Aug 21, 2002 at 03:56:06AM +0700, saki wrote:
> hello  i have internet cafe with 50 client and 1 server with 16 public address
> client1, client2, client3, client4  exit to ip.public.no.1  
> client5, client6, client7, client8  exit to ip.public.no.2  
> client9, client10, client11, client12  exit to ip.public.no.3
> ........
> ........
> client ip address 192.168.1.1 - 192.168.1.50
> public ip address 202.47.12.30 - 202.47.12.45
> 
> any one can help ?
> i have installed redhat7.2 for server

-- 
Robert Botha
jabber: flash@vitalclan.co.za


