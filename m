From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Preventing port scanning using iptables ?
Date: Wed, 9 Aug 2006 10:47:18 +0200
Message-ID: <20060809084718.GA31901@torres.l21.ma.zugschlus.de>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
	<44D4456C.5050203@mymail.ch>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
	<6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, Aug 06, 2006 at 11:26:33AM +0200, former03 | Baltasar Cevc wrote:
> If you want the scanner 
> to think the ports are closed, you could issue send back a port 
> unreachable packet (-j REJECT --reject-with icmp-port-unreachable)

The scanner will think as well that there is a filter since a port
with no listening service will generate a TCP RST packet. You can do
so with iptables, but, alas, that's the same behavior you get without
packet filter and no service on the port.

I'd say, if you don't want a service to be visible, don't run it. No
packet filter needed here.

Port scan protection might have a place should you decide to drop
packets from a certain IP if you have seen a suspicious pattern from
that IP, but that can be trivially be abused as a DoS device, and I
generally think it is not worth the trouble.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

