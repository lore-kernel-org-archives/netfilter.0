From: "Fredrik Emil Jensen" <fredrik.jensen@netpower.as>
Subject: RE: transparent proxy
Date: Wed, 17 Mar 2004 13:33:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3C204966522884458700FF59D6EFB87A01CAFE@FORUS01.netpower.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Netfilter <netfilter@lists.netfilter.org>

Thank you Antony, finally it's working for me.  I have another question
for the list; is it possible to use iptables to redirect any request on
port 80 to a specific web address?=20

I know you can use the rule, iptables -t nat -A PREROUTING -p tcp -s
192.168.1.0/24 -d 0/0 --dport 80 -j DNAT --to ip.address.xx.xx:80

But my problem occurs when you have many different subnets and you want
subnet1 to be redirected to http://test.domain.com/site1, subnet2 to be
redirected to http://test.domain.com/site2 etc.

Does anyone have any suggestions on how to do this with iptables, is it
possible? Or do I still need to use squid and squidGuard!

Regards,=20
Fredrik

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: 16. mars 2004 09:44
To: Netfilter
Subject: Re: transparent proxy

On Monday 15 March 2004 9:19 am, Fredrik Emil Jensen wrote:

> Hey
>
> I'm currently using squid and squidGuard for redirection. Setting up
the
> rules:
>
> Iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -d 0/0 --dport
80
> -j REDIRECT --to-ports 3128
>
> But does anyone know what to do if you want to use iptables to bypass
> squid with single IP address?

Yes, put a rule above that one in the PREROUTING chain which matches the

source address you don't want to be REDIRECTed, and jump out of the
chain:

iptables -I PREROUTING -t nat -p tcp -s 192.168.1.10 --dport 80 -j
ACCEPT

That will match a single address, 192.168.1.10, TCP port 80, and make
sure the=20
following REDIRECT rule is not activted.   Note the "-I" to insert the
rule=20
at the top of the list, instead of the more common "-A" which appends to
the=20
end of the list.

Regards,

Antony.


