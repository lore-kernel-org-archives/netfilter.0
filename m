From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Samba Blocked? (repost)
Date: Wed, 27 Nov 2002 00:00:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211270000.04548.netfilter@newkirk.us>
References: <001d01c29598$b3087a00$1e00a8c0@yamatto> <200211261924.56163.netfilter@newkirk.us> <001401c295bc$ee9c34c0$1e00a8c0@yamatto>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c295bc$ee9c34c0$1e00a8c0@yamatto>
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

On Tuesday 26 November 2002 09:30 pm, Dan Egli wrote:
> that is correct. And I know for a fact that NetBIOS-ns is in the servic=
es
> file because I've seen it, and I did try it both ways. Every time I try=
 to
> connect using //myserver/shared1 I get the following log lines:

Very strange.  the only packets caught here with --dport 137 are on lo wi=
th lo IP, then
--sport 137 with 64.x.x.x on lo, and --sport 137 with local 192.x x.x on =
lo.  It looks like the
'real' --dport 137 packets get through (they're not listed here) but the =
machine tries to
query itself on lo to resolve the names.  shot in the dark, try:

/sbin/iptables -A INPUT -i lo -j ACCEPT
/sbin/iptables -A OUTPUT -o lo -j ACCEPT

to let these through.  I've only done minimal work with samba, so I don't=
 know if this self-request
is normal or not...

j

> Nov 26 20:22:11 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D64.122.31.38
> DST=3D64.122.31.38 LEN=3D90 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF P=
ROTO=3DUDP SPT=3D137
> DPT=3D32807 LEN=3D70
> Nov 26 20:22:11 mail last message repeated 2 times
> Nov 26 20:22:28 mail kernel: IN=3Deth1 OUT=3D
> MAC=3D00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=3D63.241.23.201
> DST=3D64.122.31.38 LEN=3D64 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D29779 =
PROTO=3DICMP
> TYPE=3D8 CODE=3D0 ID=3D45290 SEQ=3D0
> Nov 26 20:22:29 mail kernel: IN=3Deth1 OUT=3D
> MAC=3D00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=3D63.241.23.201
> DST=3D64.122.31.38 LEN=3D64 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D29782 =
PROTO=3DICMP
> TYPE=3D8 CODE=3D0 ID=3D45290 SEQ=3D256
> Nov 26 20:22:30 mail kernel: IN=3Deth1 OUT=3D
> MAC=3D00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=3D63.241.23.201
> DST=3D64.122.31.38 LEN=3D64 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D29792 =
PROTO=3DICMP
> TYPE=3D8 CODE=3D0 ID=3D45290 SEQ=3D512
> Nov 26 20:22:37 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1 DST=3D1=
27.0.0.1
> LEN=3D78 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D32=
807 DPT=3D137 LEN=3D58
> Nov 26 20:22:42 mail last message repeated 2 times
> Nov 26 20:22:44 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D192.168.0.2
> DST=3D192.168.0.2 LEN=3D90 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PR=
OTO=3DUDP SPT=3D137
> DPT=3D32807 LEN=3D70
> Nov 26 20:22:44 mail last message repeated 2 times
> Nov 26 20:22:44 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D64.122.31.38
> DST=3D64.122.31.38 LEN=3D90 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF P=
ROTO=3DUDP SPT=3D137
> DPT=3D32807 LEN=3D70
> Nov 26 20:22:45 mail last message repeated 2 times
> Nov 26 20:23:05 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1 DST=3D1=
27.0.0.1
> LEN=3D78 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D32=
807 DPT=3D137 LEN=3D58
> Nov 26 20:23:09 mail last message repeated 2 times
> Nov 26 20:23:11 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D192.168.0.2
> DST=3D192.168.0.2 LEN=3D90 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PR=
OTO=3DUDP SPT=3D137
> DPT=3D32807 LEN=3D70
> Nov 26 20:23:12 mail last message repeated 2 times
> Nov 26 20:23:12 mail kernel: IN=3Dlo OUT=3D
> MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D64.122.31.38
> DST=3D64.122.31.38 LEN=3D90 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D0 DF P=
ROTO=3DUDP SPT=3D137
> DPT=3D32807 LEN=3D70
>
> and myserver is in my /etc/hosts as 192.168.0.2 (correct IP).
>
> Help?
>
> -- Dan
>
>
>
>
>
> ----- Original Message -----
> From: "Joel Newkirk" <netfilter@newkirk.us>
> To: "Dan Egli" <dan@shortcircuit.dyndns.org>;
> <netfilter@lists.netfilter.org>
> Sent: Tuesday, November 26, 2002 5:24 PM
> Subject: Re: Samba Blocked? (repost)
>
> On Tuesday 26 November 2002 05:10 pm, Dan Egli wrote:
> > Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filt=
er
>
> set
>
> > that will block certain ports and allow others. It seems to work
> > perfectly for anything other than Samba. If I try:
> >
> > smbclient //myserver/shared1, it fails to connect. But using the IP i=
n
> > place of it:
> > smbclient //192.168.0.2/shared1 works just fine. I am specifically
>
> allowing
>
> > NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?
> >
> > # setp 4 - setup rules
> > $IPT -A INPUT -p tcp -m multiport --dports smtp,ftp,telnet,ssh -j ACC=
EPT
> > $IPT -A INPUT -p tcp -i eth0 -m multiport --dports
>
> telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ns,netb=
ios-
>
> >d gm,netbios-ssn -j ACCEPT
> > $IPT -A INPUT -p udp -i eth0 -m multiport --dports
> > domain,ntp,netbios-ns,netbios-dgm,netbios-ssn -j ACCEPT
> > $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> > $IPT -A INPUT -j LOG
> >
> > P.S. With these rules, it should only log packets that are failing, a=
nd I
> > see the packets on port 137 in the log, so I don't know what's wrong.
>
> Have you tried replacing netbios-ns with 137 in the rules?  It may not =
be
> resolving the name properly through your /etc/services file.  I don't s=
ee
> any
> other reason they should reach the log rule.
>
> If that isn't it, maybe you can post a few of the droplog lines for 137=
s?
> Also, I assume you are seeing 137 logged only when connection fails?
>
> j


