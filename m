From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 09:06:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E894FF3@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter <netfilter@lists.netfilter.org>

root@p500:~# insmod ip_conntrack_ftp
insmod: can't read 'ip_conntrack_ftp': No such file or directory
root@p500:~#

- Insmod is when you load the module directly, there it would not work
unless you were in the _same_ directory as the ip_conntrack_ftp and you
renamed the ip_conntrack_ftp.{ko,o} ip_conntrack_ftp, then it would
work.

Otherwise, I do not see how you come to that conclusion.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Thursday, June 17, 2004 8:23 AM
To: netfilter
Subject: Re: Allow active and passive FTP connections

On Thursday 17 June 2004 1:13 pm, Piszcz, Justin Michael wrote:

> I think he meant, modprobe ip_conntrack_ftp and if you are behind nat
> there is a module for that as well.

insmod should do the job perfectly well.

NAT is very unlikely when the rules are running on the FTP server itself

(they're in the INPUT & OUTPUT chains).

Regards,

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Chris
Brenton
> Sent: Thursday, June 17, 2004 8:08 AM
> To: Sagara Wijetunga
> Cc: netfilter
> Subject: Re: Allow active and passive FTP connections
>
> On Thu, 2004-06-17 at 07:03, Sagara Wijetunga wrote:
> > I have following issues relating to above rules:
> > 1. For active FTP requests by remote clients, it drops
> > the data connection request to the remote client from
> > the server on the OUTPUT chain.
> >
> > 2. For passive FTP requests by remote clients, it
> > drops the data connection request to the server from
> > remote clients on the INPUT chain.
>
> Try:
> insmod ip_conntrack_ftp
>
> HTH,
> C

--=20
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the
list;
                                                           please don't
CC me.





