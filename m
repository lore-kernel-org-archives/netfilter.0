From: Patrick McHardy <kaber@trash.net>
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Wed, 13 Jan 2010 14:53:30 +0100
Message-ID: <4B4DD05A.4000606@trash.net>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>	<20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>	<4B4D82E2.6090405@trash.net> <20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rebeca.martinez-garcia@estudiant.upc.edu
Cc: netfilter@vger.kernel.org, vhuertas@indra.es, devel@thom.fr.eu.org

rebeca.martinez-garcia@estudiant.upc.edu wrote:
> Hi all,
> 
> I think it is better to explain the complete situation.
> 
> I have 2 SIP clients in a private LAN that connect to a public
> Server/Proxy by means of a gateway. Actually, this Server/Proxy is not
> one machine but 4: one of them is a Proxy (the first contact point of
> the SIP clients to this "platform") and another one is the Server where
> the register and authentication procedures are done.
> 
> This means that when a "private" client wants to register in this
> "platform", its REGISTER message is directed to the Proxy via the
> gateway. To make it simple, let's assume that in the "platform" the
> Proxy directly redirects the REGISTER message to the Server (it is in
> fact a little more complicated but at the end the message reaches that
> Server). However, as there is no authentication information on the
> message, it sends back to the client a 401 Unauthorized error.
> 
> The client incorporates the authentication information needed to the
> REGISTER message and sends it again to the Proxy and now the Server
> accepts the registration (it sends a 200 OK). Now this client can call
> other users registered in this "platform".
> 
> But, as the gateway NATs all incoming messages from the LAN, I faced
> problems of one-way audio and non-routing IP addresses. That was solved
> by incorporating to the CNG's iptables the nf_conntrack_sip and
> nf_nat_sip modules.
> 
> If a client wants to call another client (it does not matter if it is
> private or public, it redirects the INVITE message to the "platform"
> because it knows the callee location). So a call between two private
> clients is as I have shown in a previous e-mail (I skip the
> communication inside the platform):
> 
> Caller -------1.INVITE------>             ----------2.INVITE-------->
>                             Gateway (NAT)                          Proxy
>                       nf_conntrack_sip+nf_nat_sip
> Callee <-----4.INVITE-------              <---------3.INVITE--------
> 
> 1: INVITE sip:callee@open-ims.test
>      From: sip:caller@open-ims.test
>      To: sip:callee@open-ims.test
>      Contact: sip:caller@192.168.x.x:5061
> 2. INVITE sip:callee@open-ims.test
>      From: sip:caller@open-ims.test
>      To: sip:callee@open-ims.test
>      Contact: sip:caller@10.1.y.y:5061
> 3. INVITE sip:callee@10.1.y.y:5060
>      From: sip:caller@open-ims.test
>      To: sip:callee@open-ims.test
>      Contact: sip:caller@10.1.y.y:5061
> 4. INVITE sip:callee@10.1.y.y:5061
>      From: sip:caller@open-ims.test
>      To: sip:callee@open-ims.test
>      Contact: sip:caller@10.1.y.y:5061
> 
> And is in the 4.INVITE where I have realised there is a problem: it does
> not change the public IP of the callee to the private one, neither
> change the Contact IP of the caller.

Well, that seems to be the problem. The conntrack helper can only
recognize that the call is internal if a) the addresses have been
properly rewritten on their way out and b) the proxy keeps the
original SDP addresses and doesn't decide to relay RTP itself.

> So when they start to send their RTP streams, they send them to the
> public IP of my gateway on the corresponding port. The caller sends the
> stream to the 127.1.y.y.5060 and my gateway redirects it to the
> 192.168.x.x:5060.
> So I guess that the gateway has a table in which it indicates for each
> private_ip:port the corresponding public_ip:port.

Something like that. You can see parts of the mapping in
/proc/net/nf_conntrack_expect after registration or invitations.

> Then, if the gateway has this table (that in fact is like a local
> location information), is it possible to configure "something" in
> iptables to, knowing that the requested callee is inside the LAN, route
> the message directly to it?

No, this should work automatically. You need to figure out
why the address is not translated back, most likely there's
a mismatch between the addresses or ports in the packet
and the expectation.
