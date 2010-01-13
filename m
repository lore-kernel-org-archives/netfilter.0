From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: Re: nf_conntrack_sip and nf_nat_sip can do this??
Date: Wed, 13 Jan 2010 14:38:59 +0100
Message-ID: <20100113143859.18292p3kbz00a60g@ek2pim.upc.edu>
References: <20091214104526.93556bb1q7xj41s0@ek2pim.upc.edu>
	<20100111132614.14651hiwfxvj3h8k@ek2pim.upc.edu>
	<4B4D82E2.6090405@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4D82E2.6090405@trash.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org, vhuertas@indra.es, devel@thom.fr.eu.org

Hi all,

I think it is better to explain the complete situation.

I have 2 SIP clients in a private LAN that connect to a public =20
Server/Proxy by means of a gateway. Actually, this Server/Proxy is not =
=20
one machine but 4: one of them is a Proxy (the first contact point of =20
the SIP clients to this "platform") and another one is the Server =20
where the register and authentication procedures are done.

This means that when a "private" client wants to register in this =20
"platform", its REGISTER message is directed to the Proxy via the =20
gateway. To make it simple, let's assume that in the "platform" the =20
Proxy directly redirects the REGISTER message to the Server (it is in =20
fact a little more complicated but at the end the message reaches that =
=20
Server). However, as there is no authentication information on the =20
message, it sends back to the client a 401 Unauthorized error.

The client incorporates the authentication information needed to the =20
REGISTER message and sends it again to the Proxy and now the Server =20
accepts the registration (it sends a 200 OK). Now this client can call =
=20
other users registered in this "platform".

But, as the gateway NATs all incoming messages from the LAN, I faced =20
problems of one-way audio and non-routing IP addresses. That was =20
solved by incorporating to the CNG's iptables the nf_conntrack_sip and =
=20
nf_nat_sip modules.

If a client wants to call another client (it does not matter if it is =20
private or public, it redirects the INVITE message to the "platform" =20
because it knows the callee location). So a call between two private =20
clients is as I have shown in a previous e-mail (I skip the =20
communication inside the platform):

Caller -------1.INVITE------>             ----------2.INVITE-------->
                             Gateway (NAT)                          Pro=
xy
                       nf_conntrack_sip+nf_nat_sip
Callee <-----4.INVITE-------              <---------3.INVITE--------

1: INVITE sip:callee@open-ims.test
      From: sip:caller@open-ims.test
      To: sip:callee@open-ims.test
      Contact: sip:caller@192.168.x.x:5061
2. INVITE sip:callee@open-ims.test
      From: sip:caller@open-ims.test
      To: sip:callee@open-ims.test
      Contact: sip:caller@10.1.y.y:5061
3. INVITE sip:callee@10.1.y.y:5060
      From: sip:caller@open-ims.test
      To: sip:callee@open-ims.test
      Contact: sip:caller@10.1.y.y:5061
4. INVITE sip:callee@10.1.y.y:5061
      From: sip:caller@open-ims.test
      To: sip:callee@open-ims.test
      Contact: sip:caller@10.1.y.y:5061

And is in the 4.INVITE where I have realised there is a problem: it =20
does not change the public IP of the callee to the private one, =20
neither change the Contact IP of the caller.

So when they start to send their RTP streams, they send them to the =20
public IP of my gateway on the corresponding port. The caller sends =20
the stream to the 127.1.y.y.5060 and my gateway redirects it to the =20
192.168.x.x:5060.
So I guess that the gateway has a table in which it indicates for each =
=20
private_ip:port the corresponding public_ip:port.

Then, if the gateway has this table (that in fact is like a local =20
location information), is it possible to configure "something" in =20
iptables to, knowing that the requested callee is inside the LAN, =20
route the message directly to it?

I only want to enable internal calls.

I also tried configuring SER but it is very problematic with the =20
authentication during the register process.

I will appreciate any help and sorry for the long explanation.

Thanks in advance,
Rebeca Martinez





"Patrick McHardy" <kaber@trash.net> escribi=C3=B3:

> rebeca.martinez-garcia@estudiant.upc.edu wrote:
>>
>> Hi all,
>>
>> I have been working with nf_conntrack_sip and nf_nat_sip for a while=
 to
>> permit SIP clients in a private LAN can connect to servers outside
>> without problems.
>>
>> However, in the case of an internal call, I was wondering if it is
>> possible that these two modules detect that the incoming INVITE from=
 the
>> LAN is to another client of the same LAN and so not routing it outsi=
de.
>>
>> Is it possible??
>
> Yes, the module does exactly that when the NAT module is loaded.
>


