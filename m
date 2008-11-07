From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Redirect back to internal network
Date: Fri, 07 Nov 2008 15:12:05 -0600
Message-ID: <4914AF25.6090909@riverviewtech.net>
References: <ebccda510811070906s62a2619di8a8d54dc4b3b9f9e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ebccda510811070906s62a2619di8a8d54dc4b3b9f9e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/07/08 11:06, Henrique Netfilter wrote:
> Apparently it did work. But once my web server answers, the answer is 
> not sent back to the machines in my internal network.
> 
> Anyone that can give me some light into it?

Now that things are working, I'll explain why it was not working before.

lan.C is the internal IP of the LAN client.
lan.R is the internal IP of the router.
www.R is the external IP of the router.
www.S is the external IP of the server.
lan.S is the internal IP of the server.

The client sends the request packet with a source IP of 'lan.C' and a 
destination IP of 'www.S'.

The router receives the packet with a source IP of 'lan.C' and a 
destination IP of 'www.S'.  The router knows that any traffic going to 
'www.S' (port 80) is to be redirected to the internal server 'lan.S'. 
So the router NATs the destination address and sends a new packet with a 
source IP of 'lan.C' and a destination IP of 'lan.S'.

The server receives the packet with a source IP of 'lan.C' and a 
destination IP of 'lan.S'.  The server will process the request and 
reply with a new packet.  The server sends a new packet back to the 
client with a source address of 'lan.S' and a destination IP of 'lan.C'.

The client receives a reply packet with a source IP of 'lan.S' and a 
destination IP of 'lan.C'.  This reply packet does not match any packet 
that the client knows about so it disregards (it may also tell the 
server to reset the connection).

This is the simple premise of what I refer to as the "TCP Triangle".

You can see from the above and the rules in my other email that the 
router will have to SNAT / MASQUERADE any traffic /from the lan/ that is 
being redirected to the server.  This way the server will reply back to 
the router which will then reply back to the client.

A short packet flow will look like this:

lan.C -> www.S    # Client sends the request

lan.C -> lan.S    # Router DNAT's the request
lan.R -> lan.S    # Router SNAT's the request

lan.R -> lan.S    # Server receives the request
lan.S -> lan.R    # Server sends to the reply

lan.S -> lan.C    # Router (un)DNAT's the reply
www.S -> lan.C    # Router (un)SNAT's the reply

www.S -> lan.C    # Client receives the reply



Grant. . . .
