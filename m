From: "Gary Smith" <gary@primeexalia.com>
Subject: RE: Restrict LAN users to send mail to Internet but allow to send
	mail	to other LAN user.
Date: Wed, 27 Oct 2004 13:47:54 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <21245695958BF041875A6C39D08F9EBA1C3C21@vjo-mails-03.primeexalia.com>
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

True...  Sometimes I should read it twice... :)
=20
Gary

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Aleksandar =
Milivojevic
Sent: Wed 10/27/2004 12:16 PM
To: netfilter@lists.netfilter.org
Subject: Re: Restrict LAN users to send mail to Internet but allow to =
send mail to other LAN user.



Gary Smith wrote:
> You would still need netfilter to prevent other users from using the =
internet as a back door.  For example, financial firms must log all =
incoming and outgoing smtp traffic.  To accomplish this you need to =
ensure that your users cannot access external SMTP servers otherwise =
they could sent out unlogged messages.  We have done this in the past =
for a few companies.  This forces the user to use the sendmail server =
for their email.  I think this is the goal of the requester.

Which is exactly what my first sentence said: "I will assume that LAN
users are allowed to connect to mail server only, and not to outside
world".  BTW, this is something that should be done by default.
Financial firm or not.

--
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7




