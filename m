From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: Re: Reasons for INVALID packets ?
Date: Sun, 27 Feb 2005 15:32:12 +0100 (CET)
Message-ID: <Pine.LNX.4.61.0502271529200.32119@L01.THNET>
References: <200502271432.00952.e-boogie@yandex.ru>
Mime-Version: 1.0
In-Reply-To: <200502271432.00952.e-boogie@yandex.ru>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mikhail Zotov <e-boogie@yandex.ru>
Cc: netfilter@lists.netfilter.org

>
> IN= OUT=eth0 SRC=ROUTER DST=193.108.155.115 LEN=68 TOS=0x00 PREC=0xC0 TTL=64
> ID=22467 PROTO=ICMP TYPE=11 CODE=0 [SRC=193.108.155.115 DST=A.LAN.HOST LEN=40
> TOS=0x00 PREC=0x00 TTL=1 ID=40760 PROTO=ICMP TYPE=8 CODE=0 ID=20244
> SEQ=45126 ]
>
[...]

Why would you consider these packets invalid - TYPE=11 is "time exceeded", 
CODE=0 is "maximum lifetime of the datagram exceeded" - for whatever 
reason those packets are generated ...

Regards,
Michael

