From: lst_hoe01@kwsoft.de
Subject: Re: Strange RST,ACK packet from my Host
Date: Thu, 23 Dec 2004 20:32:20 +0100
Message-ID: <1103830340.41cb1d440ddb7@webmail.kwsoft.de>
References: <1103789255.41ca7cc7e4549@webmail.kwsoft.de>
	<1103817721.6478.74.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103817721.6478.74.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Zitat von Jason Opperisano <opie@817west.com>:

> the RST,ACK from your mail server is not the strangest packet in this
> capture by a long shot.
>
> after the three-way handshake--the remote machine sends this (before it
> ever receives the 220 banner from your mail server, already breaking th=
e
> SMTP protocol):
>
>   POST / HTTP/1.0
>
> which is not an SMTP command.

Yes, i know this is more a open proxy than a mailserver.

> the remote machine then sends:
>
>   RSET
>
> which is a request to abort the current "mail transfer" and start
> fresh.  i'm pretty sure the RFC's require the remote side to wait for a=
:
>
>   250 OK
>
> response to an RSET before continuing.  the remote machine in your
> capture can't be bothered with such trivial things, and sends message
> data:
>
>   man eugene mookie
>   abcdef
>
> which does look pretty important, especially considering we have no MAI=
L
> FROM or RCPT TO at this point.
>
> after a couple of ACK's, the remote side sends:
>
>   FIN,ACK
>
> and your machine sends:
>
>   ACK
>
> which puts this connection (with respect to your firewall) into state
> "CLOSE-WAIT."

Until this point its a normal crappy spam-send ...

>
> your mail server then sends an SMTP error:
>
>   502 Error: Command not implemented
>
> which is probably in response to the POST command at the beginning, or
> possibly the 'man eugene mookie' command.
>
> to which the remote machine sends a RST packet, as it seems to have
> moved on with its life at this point.

The mixup in the SMTP protocol could be by ESMTP pipelining ...
I'm pretty sure postfix does it right ;-)

> your firewall sees the client->server RST packet and puts the connectio=
n
> in CLOSE state.
>
> and finally, your mail server sends a RST,ACK to acknowledge the RST;
> which arrives 20 seconds after the connection went into CLOSE-WAIT, and
> 10 seconds after the RST put the connection into CLOSE.
>
> my guess is that the RST,ACK is being sent after the firewall had
> removed the connection from conntrack.  i *believe* the default timeout
> for the TCP CLOSE state is 10 seconds; which would make sense.

That was my idea at first. What really stumble me is the source port from=
 my
machine which is totally unrelated to the rest of the communication.

>
> oh--and i don't know if you've picked up on this or not--but the remote
> machine in this communication never had any honorable intentions with
> this communication, and shouldn't concern you.

Spam anyway of course but as said only the last packet is dropped by the
firewall and i want to know why it is created with this strange source po=
rt.
For my understandig it should origin from port 25 or have i missed someth=
ing???


Regards & Thanxs

Andreas

