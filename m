From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Cons?: Directed Pinholes
Date: Sun, 22 Aug 2004 18:55:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408221855.36768.Antony@Soft-Solutions.co.uk>
References: <1093194886.16081.84.camel@Sewak.Asr.Lan>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093194886.16081.84.camel@Sewak.Asr.Lan>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Sunday 22 August 2004 6:14 pm, Sanjay Arora wrote:

> Can someone please tell me about the downside of implementing directed
> pinholes in the firewall between DMZ & Green subnet.

By "Green subnet" I'm going to assume you mean your internal, private LAN...

> Specifically I want to implement directed pinholes (am presently reading up
> on them) for database access by webserver in DMZ and SMTP forwarding by
> mailserver from/to respectively the Green subnet. But I am totally unaware
> of any security & maintenence/monitoring implications.

Basically, I would say "Don't do it."

Your firewall should block all access from the Internet to your internal 
network except for reply packets (ie: it's one-way).

The DMZ is for machines which cannot be on the internal LAN because they need 
to be accessible from the Internet, and cannot be on the outside of the 
firewall because you want to protect them, therefore the firewall allows:

Selective access to/from Internet from/to DMZ
Selective access to DMZ from internal LAN
Selective access to Internet from internal LAN

It should *not* allow any access *from* machine/s on the DMZ to machines on 
the internal LAN - the connections should always be initiated from the 
inside.

The reason is: the DMZ machines are the only ones accessible from the 
Internet, therefore they are the ones which might be broken into / 
compriomised in some way (eg an application buffer overrun attack etc), and 
you don't want someone who gets root on there to have any access to your 
internal private systems, so the firewall doesn't allow connections initiated 
from the DMZ, only ones initiated from the trusted side.

If you haven't read "Building Internet Firewalls" by Chapman & Zwicky, I 
recommend it - also "Practical Unix & Internet Security" by Garfinkel & 
Spafford.

They're quite old texts, but still very valid in the concepts and approach.

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


