From: Marcelus Trojahn <trojahn@alternativa.com.br>
Subject: Re[2]: Logging MAC
Date: Fri, 21 May 2004 11:17:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2693045015.20040521111702@alternativa.com.br>
References: <5390820828.20040521103958@alternativa.com.br>
 <200405211453.02935.Antony@Soft-Solutions.co.uk>
Reply-To: Marcelus Trojahn <trojahn@alternativa.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405211453.02935.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <netfilter@lists.netfilter.org>

Friday, May 21, 2004, 10:53:02 AM, voce escreveu:

> May 21 14:47:15 Firewall kernel: IN=eth0 OUT=
> MAC=00:05:5d:63:88:b8:00:d0:58:e0:04:cf:08:00 SRC=253.47.80.398 
> DST=253.121.341.14 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=25492 DF PROTO=TCP
> SPT=3961 DPT=2745 WINDOW=16384 RES=0x00 SYN URGP=0

Not for me... Take a look:
May 21 11:13:20 BACKUP kernel: [smtp]IN=eth1 OUT=eth0 SRC=10.10.10.81
DST=200.221.11.50 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=60955 DF PROTO=TCP
SPT=2438 DPT=25 WINDOW=8192 RES=0x00 SYN URGP=0

Maybe cause I use preffix?

--
Marcelus Trojahn



