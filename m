From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 09:29:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617162957.75904.qmail@web14710.mail.yahoo.com>
References: <200406171627.02092.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406171627.02092.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Thursday 17 June 2004 4:13 pm, Sagara Wijetunga
> wrote:
> > Is it necessary to build ip_conntrack_ftp as a
> module?
> 
> Certainly not.   I always build firewall kernels as
> monolithic (everything I 
> need compiled-in, no module support, so nothing can
> be loaded or unloaded 
> afterwards).
> 
> There must be some reason why the conntrack table
> isn't recognising the 
> reverse connection (I assume you *do* have
> connection tracking support 
> compiled in as well?   I can't recall if you have to
> have this before you 
> even see the FTP question when building the
> kernel...)
> 
Yes, everything under 'IP: Netfilter Configuration'
including 'Connection tracking (required for
masq/NAT)' are compiled in. Only item not selected is
'NAT of local connections'.

> What do you see in /proc/net/ip_conntrack when the
> connection is half-open 
> (ie: about the same time as the log entry you posted
> appears)?
> 
cat /proc/net/ip_conntrack shows:
tcp      6 431999 ESTABLISHED src=[client IP addr]
dst=[server IP addr] sport=32983 dport=22 src=[server
IP addr] dst=[client IP addr] sport=22 dport=32983
[ASSURED] use=2

tcp      6 431996 ESTABLISHED src=[client IP addr]
dst=[server IP addr] sport=32987 dport=21 src=[server
IP addr] dst=[client IP addr] sport=21 dport=32987
[ASSURED] use=1

By this time following packets are dropped:
Jun 18 00:21:10 svr1 kernel: OUTPUT PKT DROPPED: IN=
OUT=eth0 SRC=[server IP addr] DST=[client IP addr]
LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=21776 DF PROTO=TCP
SPT=20 DPT=32988 WINDOW=5840 RES=0x00 SYN URGP=0

Jun 18 00:24:19 svr1 kernel: OUTPUT PKT DROPPED: IN=
OUT=eth0 SRC=[server IP addr] DST=[client IP addr]
LEN=137 TOS=0x10 PREC=0x00 TTL=64 ID=65463 DF
PROTO=TCP SPT=21 DPT=32987 WINDOW=6432 RES=0x00 ACK
PSH URGP=0

Jun 18 00:24:20 svr1 kernel: OUTPUT PKT DROPPED: IN=
OUT=eth0 SRC=[server IP addr] DST=[client IP addr]
LEN=174 TOS=0x10 PREC=0x00 TTL=64 ID=65466 DF
PROTO=TCP SPT=21 DPT=32987 WINDOW=6432 RES=0x00 ACK
PSH FIN URGP=0

What else I can check?

Sagara



		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail

