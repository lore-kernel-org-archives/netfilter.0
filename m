From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: ip_conntrack_ftp
Date: Wed, 9 Oct 2002 21:40:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021010014020.GA15955@Ajftl1.ajfthome.on.ca>
References: <E17yWou-0002dp-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E17yWou-0002dp-00@kashyyyk.netfilter.org>; from vlad@ccs.ru on Mon, Oct 07, 2002 at 08:09:53 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: vlad@ccs.ru
Cc: netfilter@lists.netfilter.org


	You must tell the conntrack module what port on which to
	track connections.

	modprobe -d ip_conntrack_ftp ports=21,20350
	if using nat for this
	modprobe -d ip_nat_ftp ports=21,20350

	Alistair


On 2002.10.07 08:09 vlad f kropachew wrote:
> hello. please ask the following question.  can i use the subject
> module for
> accepting passive ftp trafic on non-standart ports? i have the ftp on
> port
> 20350, and after make configure with pass ESTABLISHED and RELATED
> connection
> with different records, i see that ftp-data don't hit in RELATED rule,
> and
> log contain next record after data transfer:
> 
> -------------
> DEFAULT-DROP IN=eth0 OUT= 
> MAC=00:60:08:5e:b1:ff:00:60:08:10:4b:d3:08:00
> 
> SRC=217.76.32.10 DST=217.76.32.9 LEN=60 TOS=0x00 PREC=0x00 TTL=64
> ID=36164 DF
> PROTO=TCP SPT=1295 DPT=54245 WINDOW=32120 RES=0x00 SYN URGP=0
> -------------
> 
> may be this module track only standart ftp-control port?
> 
> vlad/
> 
> 
> 


