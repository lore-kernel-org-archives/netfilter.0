From: Sanjay Arora <skpobox@hotpop.com>
Subject: Re: Cons?: Directed Pinholes
Date: 22 Aug 2004 23:54:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093199079.2283.22.camel@Sewak.Asr.Lan>
References: <1093194886.16081.84.camel@Sewak.Asr.Lan>
	 <200408221855.36768.Antony@Soft-Solutions.co.uk>
Reply-To: skpobox@hotpop.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408221855.36768.Antony@Soft-Solutions.co.uk>
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

On Sun, 2004-08-22 at 23:25, Antony Stone wrote:
> On Sunday 22 August 2004 6:14 pm, Sanjay Arora wrote:
> 
> > Can someone please tell me about the downside of implementing directed
> > pinholes in the firewall between DMZ & Green subnet.
> 
> By "Green subnet" I'm going to assume you mean your internal, private LAN...
> 
Yes

> Selective access to/from Internet from/to DMZ
> Selective access to DMZ from internal LAN
> Selective access to Internet from internal LAN
> 
Hmmm..Well I have read that...but many firewalls like ipcop..the one
that I am using, seem to give unrestricted outbound connections, so I
thought that unrestricted outbound was not dangerous.

Can you point out some types of attacks/compromises/resources on
unrestricted outbound connections or the kind of problems it creates.

> It should *not* allow any access *from* machine/s on the DMZ to machines on 
> the internal LAN - the connections should always be initiated from the 
> inside.
> 
> The reason is: the DMZ machines are the only ones accessible from the 
> Internet, therefore they are the ones which might be broken into / 
> compriomised in some way (eg an application buffer overrun attack etc), and 
> you don't want someone who gets root on there to have any access to your 
> internal private systems, so the firewall doesn't allow connections initiated 
> from the DMZ, only ones initiated from the trusted side.
> 
I agree (pinholes)...and I thought so..and somebody on fedora list
suggested directed pinholes assessable from one ip address only and
since my dmz has private address space 192.168.x.x, IPs from there are
not routable to anyone outside my network, I thought that even if
someone broke into it...he would not be able to route the packets back.
Now that I think about it...anyone who has gained root would be able to
setup sort of reverse proxy...and my solution would be blown apart.

However, I have one query...if one can gain access from a directed
pinhole, which allows access from a specific ip address and port, cannot
one gain access into the network from the connections opened from
inside? Can you/anyone point out some resources on this.

Are stateful firewalls then inadequate as complete solution to security,
leaving aside user mistakes/misconfigurations. Some pointers to reading
on this would be appreciated.

> If you haven't read "Building Internet Firewalls" by Chapman & Zwicky, I 
> recommend it - also "Practical Unix & Internet Security" by Garfinkel & 
> Spafford.

Thanks for the recommendation...I will check it out.


Thank you very much for taking the time to guide me.

With best regards.
Sanjay.



