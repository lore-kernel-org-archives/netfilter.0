From: "Gary Smith" <gary@primeexalia.com>
Subject: RE: Restrict LAN users to send mail to Internet but allow to send
	mail	to other LAN user.
Date: Wed, 27 Oct 2004 11:55:41 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <21245695958BF041875A6C39D08F9EBA1C3C1E@vjo-mails-03.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>, netfilter@lists.netfilter.org

You would still need netfilter to prevent other users from using the =
internet as a back door.  For example, financial firms must log all =
incoming and outgoing smtp traffic.  To accomplish this you need to =
ensure that your users cannot access external SMTP servers otherwise =
they could sent out unlogged messages.  We have done this in the past =
for a few companies.  This forces the user to use the sendmail server =
for their email.  I think this is the goal of the requester.
=20
Gary Smith
=20
=20

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Aleksandar =
Milivojevic
Sent: Wed 10/27/2004 11:20 AM
To: netfilter@lists.netfilter.org
Subject: Re: Restrict LAN users to send mail to Internet but allow to =
send mail to other LAN user.



ads nat wrote:
> Now I want to allow LAN users to send emails to each
> other on LAN but want to allow some LAN users to send
> email to Internet(Outside world).
> Is there any way using Linux iptables firewall to
> acieve this requirement.

I will assume that LAN users are allowed to connect to mail server only,
and not to outside world.  Controlling this on Sendmail level would be
much more simpler and efficient.  Assuming you are using Sendmail as
your MTA.  Netfilter isn't suited for this, because there's no way for
it to know if SMTP connection between client (LAN user) and server is
delivery of email addressed to another LAN user, or to somebody at the
outside.  Also, Sendmail will take care of generating appropriate error
messages back to the users, while Netfilter would simply block the
traffic without any explanation to the user what happened.

--
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7




