From: Jason Opperisano <opie@817west.com>
Subject: Re: Snmp alg
Date: Fri, 11 Feb 2005 09:59:00 -0500
Message-ID: <20050211145900.GA2300@bender.817west.com>
References: <9D598A34672DF24F89FF4F851A4161950AA48057@i2km08-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9D598A34672DF24F89FF4F851A4161950AA48057@i2km08-ukbr.domain1.systemhost.net>
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

On Fri, Feb 11, 2005 at 02:03:03PM -0000, pablo.1.munoz@bt.com wrote:
> That's what I though, but it is not being translated.

not to be silly, but you *did* load the module, right?

> The thing is: I'm doing a DNAT Prerouting to reach the server, because
> originally the trap is going to my linux box. Then I have to do a SNAT
> Postrouting to change the source Ip Address of the Network Element that
> generates the trap, one by one.

and yet ppl still think i'm being stupid when i say what a bad idea this
is...

> So, Which NAT the "ip_nat_snmp_basic" module is going to translate in
> the packet payload?

i don't know.

> Anyway I can see the ip_nat_snmp_basic.ko as compiled in the netfilter
> kernel, so I though that it was going to work.

if it's not doing what you need it to--you could probably still use it
as the base for what you need though.

-j

--
"I'm better than dirt. Well, most kinds of dirt... not that fancy
 store-bought dirt... that stuff's loaded with nutrients, I... I
 can't compete with that stuff."
        --The Simpsons

