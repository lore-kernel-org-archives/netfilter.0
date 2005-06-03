From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Cambiar Encabezado de IP (Ayuda urgente x favor)
Date: Thu, 02 Jun 2005 21:00:49 -0500
Message-ID: <429FB9D1.1030008@gmx.co.uk>
References: <7b85e5305060216514cb1d860@mail.gmail.com>
	<BAY0-SMTP020332F220A20E747F8276BC070@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY0-SMTP020332F220A20E747F8276BC070@phx.gbl>
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

Yo no hablo espanol ... can't even type the n~ ... but I see errors here:

CompuGenic wrote:
> iptables -t nat -I PREROUTING -i eth0 -p tcp -m multiport --dport 
> 7777,2106 -j DNAT --to 192.168.1.2

It's "--dports" not "--dport".

> iptables -I INPUT -i eth0 -p tcp -m multiport 7777,2106 -j ACCEPT

Again, --dports is missing.

If it's the same packets you're wanting to accept, you're in the wrong 
chain. INPUT won't see these; the DNAT changes the destination to 
192.168.1.2. This rule needs to be in FORWARD, not INPUT.

iptables -I FORWARD -i eth0 -d 192.168.1.2 -p tcp -m multiport \
   --dports 7777,2106 -j ACCEPT
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

