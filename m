From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Question about -m string module
Date: Fri, 4 Feb 2005 15:23:22 -0500
Message-ID: <1a8601c50af7$5fb78630$b000a8c0@cybergeneration.com>
References: <18ba01c50acd$8d4af340$b000a8c0@cybergeneration.com><60578.142.169.215.10.1107532709.squirrel@142.169.215.10>
	<200502041427.56273.ramoni@databras.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Ramoni <ramoni@databras.com.br>, netfilter@lists.netfilter.org


This is what I expected, I only needed a confirmation :)

I think this module can help filtering data in application
level from UDP packets, but not TCP.

I'll look for a proxy solution instead for SMTP or HTTP
filtering.

Thanks all for reply

Have a nice weekend

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: "Ramoni" <ramoni@databras.com.br>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 04, 2005 11:27 AM
Subject: Re: Question about -m string module


If you want to DROP some mail using string on iptables, you will DoS you
server.

Why ?
Ok that smtp is a plain protocol, and you may drop a smtp connection if you
find a string in it.

But you are dropping the emal, you are dropping a connection.
Pay attention that the string you are searching in the drop rule, wont be in
the first packet of the connection, so the connection to your mail server
will start. After that, you will drop the rest of the packets if you find
the
string, and then, your mail server will be in a close wait state until the
timeout.

It will reach the point that all smtp processes are used and your server
wont
accept any new connections.


Sorry about the english, but I'm sure that what I say will happen.
(I've done it... lol)


On Friday 04 February 2005 13:58, Samuel Jean wrote:
> On Fri, February 4, 2005 10:23 am, Maxime Ducharme said:
> > Hello guys
>
> Hiya Maxime!
>
> > I have a question about -m string module and
> > I think you iptables geeks can answer me :)
>
> I am no geek nor guru ;)
>
> > Suppose I want to drop TCP connections with
> > specific requests.
> >
> > Example : a mail which contains the word "sperm",
>
> I don't think iptables is the proper tool for such.
> Consider using a mail proxy able to scan message for virus
> and such instead.
>
> > I'd add a rule like
> >
> > $IPTABLES -t filter -A FORWARD -p tcp --dport 25 -d OURMAILSERVER \
> >     -m string --string "sperm" -j DROP
> >
> > What is the reaction in the TCP connection ?
>
> That packet always gets lost in the black hole.
> The sender will keep sending that packet over and over again.
> However, I *think* TCP has a timeout mechanism.
>
> > The further packets of the same connection get dropped too ?
>
> No
>
> > This would mean the email cannot be sent, and stay in the foreign
> > mail server queue for X days ?
>
> My guess is the TCP algorithm would keep trying to send that particular
> packet as it didn't get any ACK for that sequence number.
>
> > Would it be the same if I use a REJECT rule ?
>
> No. I think a tcp-reset would do the trick.
>
> > Also, can fragmented TCP packets get through this ?
>
> Yes, but that `sperm' word is quite small. Most of the time,
> this whole word will stand in a framgented packet.
>
> > Thanks in advance
> >
> > Maxime Ducharme
> > Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau
>
> Bonne journ=E9e,
>
> Samuel
>
> NOTE: This email reflects author _thoughts_, not the reality.
>       I may be totally wrong, so just don't trust me :-)

--=20
Andr=E9 "Ramoni" (Cabelo)
Redes / Linux
Databras Informatica
Tel: (21) 2518-2363
Fax: (21) 2263-6830


