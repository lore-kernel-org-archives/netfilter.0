From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Samba Blocked? (repost)
Date: Tue, 26 Nov 2002 19:24:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211261924.56163.netfilter@newkirk.us>
References: <001d01c29598$b3087a00$1e00a8c0@yamatto>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001d01c29598$b3087a00$1e00a8c0@yamatto>
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
To: Dan Egli <dan@shortcircuit.dyndns.org>, netfilter@lists.netfilter.org

On Tuesday 26 November 2002 05:10 pm, Dan Egli wrote:
> Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filter=
 set
> that will block certain ports and allow others. It seems to work perfec=
tly
> for anything other than Samba. If I try:
>
> smbclient //myserver/shared1, it fails to connect. But using the IP in
> place of it:
> smbclient //192.168.0.2/shared1 works just fine. I am specifically allo=
wing
> NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?

> # setp 4 - setup rules
> $IPT -A INPUT -p tcp -m multiport --dports smtp,ftp,telnet,ssh -j ACCEP=
T
> $IPT -A INPUT -p tcp -i eth0 -m multiport --dports
> telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ns,netb=
ios-
>d gm,netbios-ssn -j ACCEPT
> $IPT -A INPUT -p udp -i eth0 -m multiport --dports
> domain,ntp,netbios-ns,netbios-dgm,netbios-ssn -j ACCEPT
> $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A INPUT -j LOG

> P.S. With these rules, it should only log packets that are failing, and=
 I
> see the packets on port 137 in the log, so I don't know what's wrong.

Have you tried replacing netbios-ns with 137 in the rules?  It may not be=
=20
resolving the name properly through your /etc/services file.  I don't see=
 any=20
other reason they should reach the log rule.

If that isn't it, maybe you can post a few of the droplog lines for 137s?=
 =20
Also, I assume you are seeing 137 logged only when connection fails?

j


