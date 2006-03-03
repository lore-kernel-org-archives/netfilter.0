From: "Ezsra McDonald" <ezsra.mcdonald@gmail.com>
Subject: Re: out of state packits
Date: Fri, 3 Mar 2006 09:13:52 -0600
Message-ID: <10bc97fe0603030713x10673694na6351b040d12172b@mail.gmail.com>
References: <10bc97fe0603030639w5a135f9breace8cc43d05c20b@mail.gmail.com>
	<57660.193.173.147.3.1141397972.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_13013_28272290.1141398832466"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57660.193.173.147.3.1141397972.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

------=_Part_13013_28272290.1141398832466
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 3/3/06, Rob Sterenborg <rob@sterenborg.info> wrote:
> On Fri, March 3, 2006 15:39, Ezsra McDonald wrote:
> > Greetings Gurus,
> >
> > I have noticed in the past few weeks that my logs
> > from several hosts show what appear to be rejections on high ports. I
> > have seen this before on a checkpoint firewall where the issue was out
> > of state packits. What would cause this on a network? I don't know
> > where to start looking for the problem.
> >
> > Any ideas?
> >
> > Here is an example of one of my logwatch report:
> >
> >
> > Denied 4690 packets on interface eth0
> >    From 4.79.181.14 - 3 packets
> >       To 172.25.14.167 - 3 packets
> >          Service: 4980 (tcp/4980) (RULE 7 -- DENY,eth0,none) - 3 packet=
s
> >    From 4.79.181.135 - 8 packets
> >       To 172.25.14.167 - 8 packets
> >          Service: 56322 (tcp/56322) (RULE 7 -- DENY,eth0,none) - 6 pack=
ets
> >          Service: 65382 (tcp/65382) (RULE 7 -- DENY,eth0,none) - 2 pack=
ets
> <snip a long log>
>
> Where do you determine these would be out of state ?
> To me, it just says that (x) packets from (y) to (z) have been denied,
> probably using "rule 7" which denies something but it doesn't say what.
>
> I think, looking at this log, no one can tell without knowing what rules =
you
> have in place, but maybe I'm overlooking something.
>
>
> Gr,
> Rob
>

I have attached a small portion of the log. The rule is my final
'catch all' rule. I am seeing this same anomaly all over my network.

This particular log shows packets SPT=3D53 which is a response to a DNS
query from this host. There are other services as well so I know its
not just the DNS server sending back out of state packets.

Let me know if you need more data.

------=_Part_13013_28272290.1141398832466
Content-Type: text/x-log; name=ipt2.log; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_ekcnalxh
Content-Disposition: attachment; filename="ipt2.log"

Feb 26 04:03:01 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:a0:8e:14:65:78:08:00 SRC=209.114.111.3 DST=172.25.14.167 LEN=69 TOS=0x00 PREC=0x00 TTL=48 ID=14638 DF PROTO=TCP SPT=25 DPT=7202 WINDOW=23360 RES=0x00 ACK PSH FIN URGP=0 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8479 DF PROTO=UDP SPT=53 DPT=26307 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8480 DF PROTO=UDP SPT=53 DPT=26319 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8481 DF PROTO=UDP SPT=53 DPT=26327 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8482 DF PROTO=UDP SPT=53 DPT=26328 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8483 DF PROTO=UDP SPT=53 DPT=26307 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8485 DF PROTO=UDP SPT=53 DPT=26319 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8486 DF PROTO=UDP SPT=53 DPT=26327 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8487 DF PROTO=UDP SPT=53 DPT=26328 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8488 DF PROTO=UDP SPT=53 DPT=26307 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8490 DF PROTO=UDP SPT=53 DPT=26319 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8491 DF PROTO=UDP SPT=53 DPT=26327 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8492 DF PROTO=UDP SPT=53 DPT=26328 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8493 DF PROTO=UDP SPT=53 DPT=26307 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8495 DF PROTO=UDP SPT=53 DPT=26319 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8496 DF PROTO=UDP SPT=53 DPT=26327 LEN=42 
Feb 26 04:10:06 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8497 DF PROTO=UDP SPT=53 DPT=26328 LEN=42 
Feb 26 04:19:12 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=80 TOS=0x00 PREC=0x00 TTL=64 ID=24069 DF PROTO=UDP SPT=53 DPT=26461 LEN=60 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42231 DF PROTO=UDP SPT=53 DPT=26577 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42232 DF PROTO=UDP SPT=53 DPT=26587 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42234 DF PROTO=UDP SPT=53 DPT=26577 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42235 DF PROTO=UDP SPT=53 DPT=26587 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42237 DF PROTO=UDP SPT=53 DPT=26577 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42238 DF PROTO=UDP SPT=53 DPT=26587 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42240 DF PROTO=UDP SPT=53 DPT=26577 LEN=37 
Feb 26 04:26:46 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=57 TOS=0x00 PREC=0x00 TTL=64 ID=42241 DF PROTO=UDP SPT=53 DPT=26587 LEN=37 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8567 DF PROTO=UDP SPT=53 DPT=26711 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8568 DF PROTO=UDP SPT=53 DPT=26712 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8569 DF PROTO=UDP SPT=53 DPT=26727 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8570 DF PROTO=UDP SPT=53 DPT=26728 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8571 DF PROTO=UDP SPT=53 DPT=26729 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8572 DF PROTO=UDP SPT=53 DPT=26711 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8573 DF PROTO=UDP SPT=53 DPT=26712 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8574 DF PROTO=UDP SPT=53 DPT=26727 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8575 DF PROTO=UDP SPT=53 DPT=26728 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8576 DF PROTO=UDP SPT=53 DPT=26729 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8577 DF PROTO=UDP SPT=53 DPT=26711 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8578 DF PROTO=UDP SPT=53 DPT=26712 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8579 DF PROTO=UDP SPT=53 DPT=26727 LEN=42 
Feb 26 04:43:26 thanatos kernel: RULE 7 -- DENY IN=eth0 OUT= MAC=00:11:43:dc:66:9e:00:d0:b7:a8:71:4b:08:00 SRC=172.25.14.170 DST=172.25.14.167 LEN=62 TOS=0x00 PREC=0x00 TTL=64 ID=8580 DF PROTO=UDP SPT=53 DPT=26728 LEN=42 


------=_Part_13013_28272290.1141398832466--

