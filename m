From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: error with the Outlook Express and iptables with the nat and packet filtering
Date: Fri, 6 Dec 2002 20:19:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212062019.47710.netfilter@newkirk.us>
References: <web-160111@gecyt.cu>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-160111@gecyt.cu>
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
To: Administrador de Red <admin@gecyt.cu>, netfilter@lists.netfilter.org

On Thursday 05 December 2002 06:13 pm, Administrador de Red wrote:
> Hi friends, i has a big problem with the iptables and you
> rules, i want to doing a nat with the packet filtering but
> when i try access to my mail with the Outlokk Express I
> can't send  and recived, the OE ask me a login and
> password, and show the following error
>
> There was a problem logging onto your mail server. Your
> Password was rejected. Account: 'mail.gecyt.cu', Server:
> 'mail.gecyt.cu', Protocol: POP3, Server Response: '-ERR
> your network does not have access to this account', Port:
> 110, Secure(SSL): No, Server Error: 0x800CCC90, Error
> Number: 0x800CCC92
>
> waht it is the problem someone can i help.
> thanks very mouch.

If the OE client receives this error then the communication through the=20
firewall/NAT is working properly, since it is able to get the request to=20
the server, and receive a reply from it.  The actual text of the error=20
('your network does not have access to this account') makes me suspect a=20
cause.  My suspicion is this (cheating, in that I looked at the rules in=20
your next post :^):
You DNAT the packets to forward them to the server.  You SNAT them as=20
well, so that they return to your firewall for reverse handling.  The IP=20
address of the firewall box (the one that the SNAT is putting in as the=20
source IP on the requests) is not recognized as part of the appropriate=20
IP range that the user account is expected to connect from, and the=20
server is refusing to allow it.  Quite a few ISP's do this now on SMTP,=20
as an anti-spam measure, I've rarely seen it for POP3 though.

Is this an email server that you control?  If so, or if you can influence=
=20
someone who can, check the configuration to see if it is restricted in=20
this manner.  If it is, see if the restriction can be modified to=20
recognize the public IP that you use in your SNAT.  If not, I'm not sure=20
what can be done. :^(

j



