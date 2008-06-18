From: Benedikt Gollatz <ben@differentialschokolade.org>
Subject: Re: Why is this traffic dropped?
Date: Wed, 18 Jun 2008 21:41:15 +0200
Message-ID: <200806182141.16442.ben@differentialschokolade.org>
References: <200806181711.m5IHBbkX023710@doug.ats.sensis.com> <48594DE4.9070006@freemail.hu> <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806182036500.14231@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday 18 June 2008 20:37:27 Jan Engelhardt wrote:

> >> Jun 18 17:03:39 iahabs1 kernel: IN_DROP: IN=eth0 OUT=
> >> MAC=00:1c:23:ca:ec:1d:00:1b:53:87:68:c0:08:00 SRC=10.192.130.104
> >> DST=192.168.51.1 LEN=40 TOS=0x00 PREC=0x00 TTL=119 ID=5563 DF PROTO=TCP
> >> SPT=35557 DPT=80 WINDOW=65149 RES=0x00 ACK FIN URGP=0
> >
> > Because it is a FIN packet... =  ! (NEW,RELATED or ESTABLISHED) but
> > INVALID !!!
>
> Seriously, FIN packets should not be dropped, otherwise a connection
> is lurking around until it times out.

Some port scanners use FIN-Packets ("FIN scan", "Xmas scan") to check whether 
a RST is sent back (service listening) or the packet is just ignored (no 
service there). In this case, incoming FIN packets won't belong to a 
connection, are therefore INVALID, and can be dropped, if you think that 
blocking this port scans enhances your security.

FIN packets should not be INVALID if there's an entry in the state table for 
the connection they belong to anyway, or am I missing something?

Benedikt
