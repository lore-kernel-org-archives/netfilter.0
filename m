From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: script firewall
Date: Tue, 20 Apr 2004 21:10:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404202110.48904.Antony@Soft-Solutions.co.uk>
References: <20040420195318.81826.qmail@web40514.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420195318.81826.qmail@web40514.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Tuesday 20 April 2004 8:53 pm, Luis GUSTAVO wrote:

> I=B4m looking for a firewall script, for my ADSL conection, and share
> my conection.
>
> And i want block ports 1024:65535

I assume you mean you want to block *incoming* ports (in which case I won=
der=20
why you only want to block above 1023), so how about this:

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $int_IF -o $ext_IF -j ACCEPT
iptables -A POSTROUTING -t nat -o $ext_IF -j MASQUERADE

Let us know if you have any problems with it, or if there is anything I d=
idn't=20
understand from your requirements.

Regards,

Antony.

--=20
Most people have more than the average number of legs.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


