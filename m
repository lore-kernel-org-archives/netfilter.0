From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_ftp doesn't work
Date: Mon, 24 Jun 2002 20:30:26 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624193028.RXJI295.mta03-svc.ntlworld.com@there>
References: <20020614194204.A232@rainbow> <20020624151606.07c61b2c.adam@vbfx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020624151606.07c61b2c.adam@vbfx.com>
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
To: netfilter@lists.samba.org

On Monday 24 June 2002 8:16 pm, Adam Young wrote:

> On Fri, 14 Jun 2002 19:42:04 +0200
>
> Giovanni Cardone <g_cardone@libero.it> wrote:
> > On 2.4.18 with 1.2.7(1.2.6a too) ftp conntrack module doesn't work.
> > I'm trying to understand this using a simple script:

[script snipped]

> > The logs shows up some entries like these:
> >
> > Jun 14 19:10:44 darkstar kernel: IN=ppp0 OUT= MAC= SRC=195.210.93.107
> > DST=151.26.80.131 LEN=60 TOS=0x08 PREC=0x00 TTL=58 ID=40516 DF
> > PROTO=TCP SPT=20 DPT=1039 WINDOW=32120 RES=0x00 SYN URGP=0

> > What do I need to do?
>
> 	perhaps modprobe'ing ip_nat_ftp ? I believe that's the module name,
> that you may need.

But the script is not doing any NAT, and the log entry shows valid addresses 
for both source and destination, so I don't think an FTP NAT module is going 
to help ?

 

Antony.

