From: "Dan Egli" <dan@shortcircuit.dyndns.org>
Subject: Re: Samba Blocked? (repost)
Date: Tue, 26 Nov 2002 19:30:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001401c295bc$ee9c34c0$1e00a8c0@yamatto>
References: <001d01c29598$b3087a00$1e00a8c0@yamatto> <200211261924.56163.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

that is correct. And I know for a fact that NetBIOS-ns is in the services
file because I've seen it, and I did try it both ways. Every time I try to
connect using //myserver/shared1 I get the following log lines:

Nov 26 20:22:11 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=64.122.31.38
DST=64.122.31.38 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32807 LEN=70
Nov 26 20:22:11 mail last message repeated 2 times
Nov 26 20:22:28 mail kernel: IN=eth1 OUT=
MAC=00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=63.241.23.201
DST=64.122.31.38 LEN=64 TOS=0x00 PREC=0x00 TTL=48 ID=29779 PROTO=ICMP TYPE=8
CODE=0 ID=45290 SEQ=0
Nov 26 20:22:29 mail kernel: IN=eth1 OUT=
MAC=00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=63.241.23.201
DST=64.122.31.38 LEN=64 TOS=0x00 PREC=0x00 TTL=48 ID=29782 PROTO=ICMP TYPE=8
CODE=0 ID=45290 SEQ=256
Nov 26 20:22:30 mail kernel: IN=eth1 OUT=
MAC=00:80:ad:c8:b0:a9:00:00:c5:81:21:44:08:00 SRC=63.241.23.201
DST=64.122.31.38 LEN=64 TOS=0x00 PREC=0x00 TTL=48 ID=29792 PROTO=ICMP TYPE=8
CODE=0 ID=45290 SEQ=512
Nov 26 20:22:37 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=32807 DPT=137 LEN=58
Nov 26 20:22:42 mail last message repeated 2 times
Nov 26 20:22:44 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=192.168.0.2
DST=192.168.0.2 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32807 LEN=70
Nov 26 20:22:44 mail last message repeated 2 times
Nov 26 20:22:44 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=64.122.31.38
DST=64.122.31.38 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32807 LEN=70
Nov 26 20:22:45 mail last message repeated 2 times
Nov 26 20:23:05 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1
LEN=78 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=32807 DPT=137 LEN=58
Nov 26 20:23:09 mail last message repeated 2 times
Nov 26 20:23:11 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=192.168.0.2
DST=192.168.0.2 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32807 LEN=70
Nov 26 20:23:12 mail last message repeated 2 times
Nov 26 20:23:12 mail kernel: IN=lo OUT=
MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=64.122.31.38
DST=64.122.31.38 LEN=90 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=137
DPT=32807 LEN=70

and myserver is in my /etc/hosts as 192.168.0.2 (correct IP).

Help?

-- Dan





----- Original Message -----
From: "Joel Newkirk" <netfilter@newkirk.us>
To: "Dan Egli" <dan@shortcircuit.dyndns.org>;
<netfilter@lists.netfilter.org>
Sent: Tuesday, November 26, 2002 5:24 PM
Subject: Re: Samba Blocked? (repost)


On Tuesday 26 November 2002 05:10 pm, Dan Egli wrote:
> Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filter
set
> that will block certain ports and allow others. It seems to work perfectly
> for anything other than Samba. If I try:
>
> smbclient //myserver/shared1, it fails to connect. But using the IP in
> place of it:
> smbclient //192.168.0.2/shared1 works just fine. I am specifically
allowing
> NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?

> # setp 4 - setup rules
> $IPT -A INPUT -p tcp -m multiport --dports smtp,ftp,telnet,ssh -j ACCEPT
> $IPT -A INPUT -p tcp -i eth0 -m multiport --dports
>
telnet,ssh,domain,nntp,ntp,printer,pop3,imap,http,https,netbios-ns,netbios-
>d gm,netbios-ssn -j ACCEPT
> $IPT -A INPUT -p udp -i eth0 -m multiport --dports
> domain,ntp,netbios-ns,netbios-dgm,netbios-ssn -j ACCEPT
> $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A INPUT -j LOG

> P.S. With these rules, it should only log packets that are failing, and I
> see the packets on port 137 in the log, so I don't know what's wrong.

Have you tried replacing netbios-ns with 137 in the rules?  It may not be
resolving the name properly through your /etc/services file.  I don't see
any
other reason they should reach the log rule.

If that isn't it, maybe you can post a few of the droplog lines for 137s?
Also, I assume you are seeing 137 logged only when connection fails?

j



