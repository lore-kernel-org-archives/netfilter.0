From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: XP DNS requests (nfcan: addressed to exclusive sender for this address)
Date: Mon, 14 Jun 2004 19:46:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040614234629.GA30800@salty>
References: <E9E5BFC4DD34D511B79900104B939D780325D27D@GB-CSC-EXCH-8>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E9E5BFC4DD34D511B79900104B939D780325D27D@GB-CSC-EXCH-8> (from +nfcan+jimlaur+f0b122d971.Marc.Wyburn#gb.unisys.com@spamgourmet.com on Mon, Jun 14, 2004 at 09:25:33 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.06.14 09:25, Wyburn Marc Anil  - Marc.Wyburn@gb. 
unisys.com wrote:

> This problem has got me stumped!!!!  I have netfilter
> setup (v 1.2.8.13) on a Fedora Core 1 box.  It seems to  
> be working fine except that I it is dropping DNS  
> requesets from XP clients.  Win2K and NT clients work  
> fine.  If I do an NSlookup on the XP box it resolves  
> names fine.  If I try to connect it will connect once
> or twice but then iptables starts dropping all the DNS  
> requests on their way out.
> Heres a syslog entry.
> 
> Jun 14 10:00:31 fw kernel: IN=eth1 OUT=eth0
> SRC=192.168.0.19 DST=***.***.***.***
> LEN=61 TOS=0x00 PREC=0x00 TTL=127 ID=26601
> PROTO=UDP SPT=1029 DPT=53 LEN=41	
>
Well, it seems that you are logging it.
Why do you think iptables is not the source
of the log message you showed above?

If you are logging this from iptables,
then you could add something like:
... -j LOG --log-prefix "IPT DNS REJ "
to confirm the rule involved.

Perhaps knowing the rule involved would
provide some insight?

You could also look at the counts, using:
  iptables -L -nvx
to see if you can identify the rule that way.

I think I had an XP related problem that
resulted from being very fussy about dns
connections. I think XP uses a varying high
source port, like the 1029 your log shows,
and I think that may be unusual.

Is it possible that you have rules that
might block upd source ports in this range?

Jim

