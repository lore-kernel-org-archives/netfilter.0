From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Cons?: Directed Pinholes
Date: Sun, 22 Aug 2004 20:04:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408222004.59916.Antony@Soft-Solutions.co.uk>
References: <1093194886.16081.84.camel@Sewak.Asr.Lan> <200408221855.36768.Antony@Soft-Solutions.co.uk> <1093199079.2283.22.camel@Sewak.Asr.Lan>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1093199079.2283.22.camel@Sewak.Asr.Lan>
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

On Sunday 22 August 2004 7:24 pm, Sanjay Arora wrote:

> On Sun, 2004-08-22 at 23:25, Antony Stone wrote:
>
> > Selective access to/from Internet from/to DMZ
> > Selective access to DMZ from internal LAN
> > Selective access to Internet from internal LAN
>
> Hmmm..Well I have read that...but many firewalls like ipcop..the one
> that I am using, seem to give unrestricted outbound connections, so I
> thought that unrestricted outbound was not dangerous.

Depends who your users are :)

> Can you point out some types of attacks/compromises/resources on
> unrestricted outbound connections or the kind of problems it creates.

No, when I said "selective", I meant "whatever fits your chosen security 
policy".   If you choose to allow all outbound traffic, then that's fine, so 
long as you trust your users not to get worm infections and flood the 
Internet from your IP etc.

> > The reason is: the DMZ machines are the only ones accessible from the
> > Internet, therefore they are the ones which might be broken into /
> > compromised in some way (eg an application buffer overrun attack etc),
> > and you don't want someone who gets root on there to have any access to
> > your internal private systems, so the firewall doesn't allow connections
> > initiated from the DMZ, only ones initiated from the trusted side.
>
> I agree (pinholes)...and I thought so..and somebody on fedora list
> suggested directed pinholes assessable from one ip address only and

All that means is that the attacker needs to get access to the machine with 
that IP address

> since my dmz has private address space 192.168.x.x, IPs from there are
> not routable to anyone outside my network,

Huh?   So how do machines on your DMZ reply to external connections?   And if 
there aren't any external connections, what are they doing in a DMZ?   I'm 
puzzled.   You must have some NAT going on, or it wouldn't be a DMZ...

> I thought that even if
> someone broke into it...he would not be able to route the packets back.
> Now that I think about it...anyone who has gained root would be able to
> setup sort of reverse proxy...and my solution would be blown apart.

No, anyone who gains root (or quite possibly even an unprivileged account, but 
can run applications) can get access to your internal LAN machines from the 
DMZ, if the firewall allows it.   Even if it's a "pinhole" connection, they 
can still try some way to exploit that.

> However, I have one query...if one can gain access from a directed
> pinhole, which allows access from a specific ip address and port, cannot
> one gain access into the network from the connections opened from
> inside?

No, because an attacker who gets control of a DMZ machine where the firewall 
blocks connections from DMZ->LAN cannot initiate anything to the inside.

> Are stateful firewalls then inadequate as complete solution to security,

Yes, no(single)thing is a complete solution to security

> leaving aside user mistakes/misconfigurations. Some pointers to reading
> on this would be appreciated.

The phrase is "security in depth".   You use multiple lines of defence to make 
an attacker's job difficult in different ways.

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


