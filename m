From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Logging MAC
Date: Fri, 21 May 2004 14:53:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405211453.02935.Antony@Soft-Solutions.co.uk>
References: <5390820828.20040521103958@alternativa.com.br>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5390820828.20040521103958@alternativa.com.br>
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

On Friday 21 May 2004 2:39 pm, Marcelus Trojahn wrote:

> Folks,
>
>   I  want  to know if there is a way to the LOG
>   target logs the MAC address of the connection too...

The LOG target does log the MAC address of the connection.   Here's an example 
of a packet from my system a minute ago (IPs obscured):

May 21 14:47:15 Firewall kernel: IN=eth0 OUT= 
MAC=00:05:5d:63:88:b8:00:d0:58:e0:04:cf:08:00 SRC=253.47.80.398 
DST=253.121.341.14 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=25492 DF PROTO=TCP 
SPT=3961 DPT=2745 WINDOW=16384 RES=0x00 SYN URGP=0

That long string after MAC= tells you the MAC addresses at each end of the 
link (first 6 bytes = local (firewall) end; next six bytes = remote end; last 
two bytes means IP packet inside this ethernet frame)

Therefore taking the above example, 00:d0:58:e0:04:cf is the MAC address of 
the system connecting to my firewall.

>   Sorry about my english... I hope you can understand me...

No problem at all :)

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


