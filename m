From: Andreas Meyer <anmeyer@gmx.net>
Subject: Re: strange connetions to exodus.net
Date: Sat, 21 Feb 2004 17:09:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040221170951.6d7ddfae.anmeyer@gmx.net>
References: <20040221122547.1cb9a3eb.anmeyer@gmx.net>
	<1077377146.5329.8.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077377146.5329.8.camel@tarkus>
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

Ted Kaczmarek <tedkaz@optonline.net> wrote:

> Look at the source of the web site you are visiting.
> 
> Ted


> > Feb 21 11:53:41 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
> >  DST=209.225.0.6 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160 PROTO=TCP \
> >  SPT=41197 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
> > 
> > It seems that with every request to a website there is also a request to
> > IP 209.225.0.6 wich leads to exodus.net.
> > 
> > I am completely worried about this. Who can tell me what is going on?


Ted:

Feb 21 16:59:22 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
 DST=209.225.11.237 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 PROTO=TCP \
 SPT=41504 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0
Feb 21 16:59:23 delta kernel: DROP-TCP :IN= OUT=eth1 SRC=192.168.20.60 \
 DST=82.139.196.116 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=22160 PROTO=TCP \
 SPT=41501 DPT=80 WINDOW=5840 RES=0x00 SYN URGP=0

Good point but this is my own site at 82.139.196.116 and I am sure
there is nothing pointing to exodus.net. Is this a DNS thing?

Regards
-- 
   Andreas Meyer

