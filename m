From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: iptables
Date: Mon, 10 Jun 2002 21:24:07 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <005101c210ef$103df800$020aa8c0@matttm9svd8lrh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Paulo Andre <PAndre@autopage.altech.co.za>, "Netfilter (E-mail)" <netfilter@lists.samba.org>

oops. Make sure you use port 25 though:

c:\> telnet mailserver.domain.com 25

----- Original Message -----
From: "Matthew Hellman" <mhellman@raccoon.com>
To: "Paulo Andre" <PAndre@autopage.altech.co.za>; "Netfilter (E-mail)"
<netfilter@lists.samba.org>
Sent: Monday, June 10, 2002 9:23 PM
Subject: Re: iptables


> try telnetting from the exchange server to a mail server on the Internet.
>
> ----- Original Message -----
> From: "Paulo Andre" <PAndre@autopage.altech.co.za>
> To: "Netfilter (E-mail)" <netfilter@lists.samba.org>
> Sent: Monday, June 10, 2002 9:06 AM
> Subject: iptables
>
>
> > I have a Exchange server that needs to send mail out, the firewall
> > (iptables) is set up as follows:
> >
> > iptables -A FORWARD -s (mail srv) -p tcp --dport 25 -j ACCEPT
> >
> > The mail server comes back with a "Host unreachable" error, and nslookup
> and
> > traceroute takes me to the destination fine. Anyone have any ideas...???
> >
> >
> >
> >
>



