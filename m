From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: advanced ip accounting
Date: Fri, 5 Jul 2002 13:00:09 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070513000901.14428@Lms>
References: <20020705074508.GB2006@mt.mk.cvut.cz>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020705074508.GB2006@mt.mk.cvut.cz>
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
To: Martin Tomasek <mtd@mk.cvut.cz>
Cc: netfilter@lists.samba.org

On Friday 05 July 2002 09:45, Martin Tomasek wrote:
> Hello all,
>
> I'm looking for some accounting for netfilter, which should be used like
> this:
>
> iptables -A FORWARD -s 1.2.0.0/16 -j ACCOUNTING
>
> and which sends data to userspace periodically. It should collect
> protocol-ips-ports triplets, for which it will count bytes.
> I could't use -j ULOG or pcap because of big overhead -- I want to use
> it on gigabit router.
>
> Have you seen something like this?

How about using the "IP accounting" facility of iptables? Try:

#iptables -A FORWARD -s 1.2.0.0/16

i.e. without the -j option, to create a counter, and use

#iptables -L -v

to read out the results.

#iptables -Z 

to reset.

You can make similar entries to count by service port.

Jan Humme.

