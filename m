From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPtables FORWARD syntax question/error
Date: Sat, 10 Jul 2004 09:40:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407100940.50171.Antony@Soft-Solutions.co.uk>
References: <40EEC3F6.7050306@mail.co.gilchrist.fl.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40EEC3F6.7050306@mail.co.gilchrist.fl.us>
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

On Friday 09 July 2004 5:12 pm, Eric Ellis wrote:

> I have a webcache/external proxy on the network that I want to route all
> web traffic from Squid to.  I assumed the following to work:
>
> iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination
> xx.xx.xx.xx:8080
>
> the thing is that it gives me the error "invalid argument".  Here's what
> else I've tried, with errors:
>
> root@firewall:/etc# iptables -t nat -A POSTROUTING -p tcp --dport 80 -j
> DNAT --to-destination xx.xx.xx.xx:8080
> iptables: Invalid argument

DNAT is not valid in the POSTROUTING chain, only PREROUTING and OUTPUT.

> root@firewall:/etc# iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT
> --to-destination xx.xx.xx.xx:8080
> iptables: Invalid argument

That looks like a valid rule to me (but see below).

> root@firewall:/etc# iptables -A OUTPUT -p tcp --dport 80 -j DNAT
> --to-destination xx.xx.xx.xx:8080
> iptables: Invalid argument

DNAT is not valid in the (default) filter table, only in the nat table.

> root@firewall:/etc# iptables -A OUTPUT -p tcp --dport 80 -j DNAT
> --to-destination xx.xx.xx.xx
> iptables: Invalid argument

DNAT is not valid in the (default) filter table, only in the nat table.

> The troubling thing that I'm having here is that I don't know what about
> the rule that I'm requesting to set up is borked, and I can't really
> find any material on it in the past few days that I've been looking.  It
> *appears* to be a valid rule, according to what I've read at
> http://iptables-tutorial.frozentux.net/ and other various
> documentation/HOW-TOs/newb help references.  I think I'm missing
> something *really* obvious, but I don't have the depth to find it.

I think your netfilter rule is fine, but I suspect you don't have OUTPUT DNAT 
enabled in the kernel - i's a separate option from the normal NAT stuff, 
which you have to select if you need it.

Regards,

Antony.

-- 
I own three Windows books, published by O'Reilly.   They are "Windows 
Annoyances", "Office 97 Annoyances" and "Windows 98 Annoyances".   That 
pretty much sums it up for me.

                                                     Please reply to the list;
                                                           please don't CC me.


