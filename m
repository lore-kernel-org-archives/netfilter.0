From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: Log Entries with multiple PROTO fields?
Date: Fri, 19 Mar 2004 14:22:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079698506.2346.4.camel@carve.personal.localdomain>
References: <20040317141056.M19130@tkevans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040317141056.M19130@tkevans.com>
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

On Wed, 2004-03-17 at 16:10, Tim Evans wrote: [snipped]
> What do these kind of log message mean?  Note there are two PROTO fields:
> 
> Mar  8 08:19:43 kernel: IPT OUT_ICMP: IN= OUT=eth1 SRC=x.x.x.xDST=x.x.x.
> .x LEN=76 TOS=0x00 PREC=0xC0 TTL=64 ID=54844 PROTO=ICMP TYPE=11 CODE=0
> [SRC=x.x.x.x DST=x.x.x.x LEN=48 TOS=0x00 PREC=0x00 TTL=1 ID=0 DF PROTO=TCP
> SPT=110 DPT=4312 WINDOW=5840 RES=0x00 ACK SYN URGP=0 ]

this is an ICMP packet sent in response to the TCP packet which is
detailed inside []


