From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: -m string  and RELATED
Date: Mon, 4 Nov 2002 19:04:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021104190439.DGTP292.mta03-svc.ntlworld.com@there>
References: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
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
To: netfilter@lists.samba.org

On Monday 04 November 2002 10:14 am, Arkadiusz Miskiewicz wrote:

> Hi,
>
> I'm trying to log whole stream basing on string match.
>
> iptables -A INPUT -m string --string "xyztest" -j LOG --log-prefix
> "xyztest: " -m state --state NEW,ESTABLISHED,RELATED
>
> xyztest
> 500 unrecognized command
>
> - Nov  4 11:11:20 arm kernel: xyztest: IN=eth0 OUT=
> MAC=00:10:22:fe:5a:91:00:02:44:1f:f3:b4:08:00 SRC=156.17.235.253
> DST=156.17.236.105 LEN=61 TOS=0x10 PREC=0x00 TTL=62 ID=53540 DF PROTO=TCP
> SPT=2637 DPT=25 WINDOW=5840 RES=0x00 ACK PSH URGP=0 (logged packet which
> contains xyztest packet)
>
> tralala
> 500 unrecognized command
>
>  - nothing logged
>
> Why is this not working - there is ESTABILISHED,RELATED rule - any ideas?

It is working.

Every packet which comes in to the machine is tested against the rules in the 
INPUT chain, and if the conditions match, then the target is triggered.

Your rule says "if the packet contains the string xyztest and is state new, 
established, or related, then log the packet with prefix xyztest".

Therefore all packets which contain the string xyztest and which are new, 
established or related will get logged.

If a packet doesn't contain the string xyztest it won't match the test and it 
won't get logged.

Keep in mind that iptables is a packet filtering firewall.   It examines each 
packet independently.

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

