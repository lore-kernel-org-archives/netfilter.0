From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to use DNAT
Date: Fri, 18 Feb 2011 00:41:26 +0100
Message-ID: <4D5DB226.7050002@plouf.fr.eu.org>
References: <184364666.3998.1297982398411.JavaMail.root@tahiti.vyatta.com> <1507403965.4030.1297983445466.JavaMail.root@tahiti.vyatta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1507403965.4030.1297983445466.JavaMail.root@tahiti.vyatta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Steven Kath <steven.kath@vyatta.com>
Cc: Italo Valcy <italo@dcc.ufba.br>, netfilter@vger.kernel.org

Steven Kath a =E9crit :
> ----- "Italo Valcy" <italo@dcc.ufba.br> wrote: -----
>>
>> Well... so could be this: INVALID state... The packets are about a
>> netflow traffic (9996/UDP) comming to the firewall, which should be
>> redirected to a internal host (through the DNAT). How can I debug
>> these possible INVALID packets?
>=20
> iptables -I FORWARD -p udp -m udp --dport 9996 -m state --state INVAL=
ID -j LOG --log-prefix "INVALID-FWD: "=20
> iptables -I INPUT -p udp -m udp --dport 9996 -m state --state INVALID=
 -j LOG --log-prefix "INVALID-IN: "=20
>=20
> This will allow you to see matching traffic through the filter=20
> table's FORWARD and INPUT chains with the invalid state in dmesg.=20

AFAIK, UDP packets cannot be INVALID.

> Also, bear in mind that the nat table is only consulted for=20
> packets with state NEW. If your UDP flow state transitions to=20
> ESTABLISHED before your NAT rule is created, the new rule will=20
> not be applied to that flow. =20

Actually it is even stricter : the nat rules are consulted only for the
first packet of a new flow ("connection"). The next packets skip the na=
t
rules even when the flow does not transition to ESTABLISHED (when there
is no packet in the reply direction).

> You'd need to clear that connection from the table with=20
> conntrack-tools, flush the entire table, or let the connection=20
> expire from the table for it to be considered NEW again and=20
> compared against the nat rules.=20

