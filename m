From: Jason Opperisano <opie@817west.com>
Subject: Re: Strange RST,ACK packet from my Host
Date: Thu, 23 Dec 2004 11:02:01 -0500
Message-ID: <1103817721.6478.74.camel@hubcap.ljm.dom>
References: <1103789255.41ca7cc7e4549@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103789255.41ca7cc7e4549@webmail.kwsoft.de>
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

On Thu, 2004-12-23 at 03:07, lst_hoe01@kwsoft.de wrote:
> Hello
> 
> we have a mailserver protected itself by iptables and a firewall (iptables) in
> front of it. The firewall sometimes log RST,ACK packets from our mailserver as
> not permitted so i have done a tcpdump trace for one source IP for which this
> is happening (attached to the mail).
> This trace shows that after the last packet from the remote (217.219.215.10) our
> mailserver respond with a RST,ACK packet from a random high port which is
> dropped from the firewall because it does not match any connection??
> 
> Can anyone explain why the mailserver send this strange packet?
> 
> OS is Linux Kernel 2.4.21
> Iptables v1.2.8

the RST,ACK from your mail server is not the strangest packet in this
capture by a long shot.

after the three-way handshake--the remote machine sends this (before it
ever receives the 220 banner from your mail server, already breaking the
SMTP protocol):

  POST / HTTP/1.0

which is not an SMTP command.

the remote machine then sends:

  RSET

which is a request to abort the current "mail transfer" and start
fresh.  i'm pretty sure the RFC's require the remote side to wait for a:

  250 OK

response to an RSET before continuing.  the remote machine in your
capture can't be bothered with such trivial things, and sends message
data:

  man eugene mookie
  abcdef

which does look pretty important, especially considering we have no MAIL
FROM or RCPT TO at this point.

after a couple of ACK's, the remote side sends:

  FIN,ACK

and your machine sends:

  ACK

which puts this connection (with respect to your firewall) into state
"CLOSE-WAIT."

your mail server then sends an SMTP error:

  502 Error: Command not implemented

which is probably in response to the POST command at the beginning, or
possibly the 'man eugene mookie' command.

to which the remote machine sends a RST packet, as it seems to have
moved on with its life at this point.

your firewall sees the client->server RST packet and puts the connection
in CLOSE state.

and finally, your mail server sends a RST,ACK to acknowledge the RST;
which arrives 20 seconds after the connection went into CLOSE-WAIT, and
10 seconds after the RST put the connection into CLOSE.

my guess is that the RST,ACK is being sent after the firewall had
removed the connection from conntrack.  i *believe* the default timeout
for the TCP CLOSE state is 10 seconds; which would make sense.

oh--and i don't know if you've picked up on this or not--but the remote
machine in this communication never had any honorable intentions with
this communication, and shouldn't concern you.

-j

--
"Kids, you tried your best and you failed miserably. The lesson is,
 never try."
	--The Simpsons


