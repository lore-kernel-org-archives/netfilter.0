From: Curby <curby@cur.by>
Subject: Re: match many protocol in a rule
Date: Thu, 17 Jun 2010 17:23:38 -0600
Message-ID: <AANLkTilErsiq8IUBxUUUq-EhS6KUQUEs6KNHKVD4UPCH@mail.gmail.com>
References: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinVb4YBnyfJJN6JFA4U9TDDonG2Drmtz-yjMIOV@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Mamadou_Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

2010/6/17 Mamadou Tour=E9 <e2ia.ci@gmail.com>:
> Hi all how could i much many protocole in a rule.
> I've tried iptable -A INPUT -p tcp,upd --dport 508 -j ACCEPT
> but i got error message : iptables v1.4.4: unknown protocol `udp,tcp'=
 specified

I was looking for a similar feature (as it exists in ipfw) but I don't
think that's possible in iptables.  If you want to specify multiple
protocols for the purpose of ending with a consistent action or set of
actions, you could make the multiple rules jump to a custom chain
which then performs the actions.  However if you want to specify
multiple protocols to reduce the number of rules, I don't think that
will work.

I'd love to hear otherwise though, if anyone has other ideas.

--Mike
