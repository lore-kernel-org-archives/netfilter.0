From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT of ICMP fragmentation-needed
Date: Mon, 10 Jun 2002 12:38:54 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101139.g5ABcxU08029@vulcan.rissington.net>
References: <Pine.LNX.4.44.0206101330580.30649-100000@albert.ha-vel.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206101330580.30649-100000@albert.ha-vel.cz>
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

On Monday 10 June 2002 12:35 pm, jakub@angel.cz wrote:

> no no no :), they are not droped by router, I can see them on outgoing
> interface and also on the next router. I really know what I am writing,
> now I have log in PRE, FORW and POST chains only this is logged:
>
> Jun 10 13:18:58 r kernel: icmp SNAT PRE IN=eth3 OUT=
> MAC=00:e0:7d:01:77:f6:00:50:da:4e:f4:a1:08:00 SRC=10.252.1.2
> DST=212.80.76.6 LEN=576 TOS=0x00 PREC=0xC0 TTL=255 ID=29618 PROTO=ICMP
> TYPE=3 CODE=4 [SRC=212.80.76.6 DST=195.39.69.86 LEN=1500 TOS=0x00
> PREC=0x00 TTL=56 ID=28356 DF PROTO=TCP SPT=80 DPT=63776 WINDOW=32120
> RES=0x00 ACK PSH URGP=0 ] MTU=500

The source address of this packet is 10.252.1.2.   The rule you had earlier 
was trying to match a source address of 192.168.0.0/16.


Antony.

