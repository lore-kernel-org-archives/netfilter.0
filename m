From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Snuffing out hackers
Date: Wed, 16 Jul 2003 15:47:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716194731.GC27608@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF5122DF6@alderaan.smgtec.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DF6@alderaan.smgtec.com>
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
Content-Transfer-Encoding: 7bit
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

This is an icmp(3:3) which means port unreachable. This is an innocent
icmp. However, the question is as to why you receive it on your router
if 24.57.108.11 has nothing to do with you... If it's a correct statement
that it's coming from outside and you don't have anything to do with
24.57.108.11, then the only way it could come to you is by source-routing
which should have been turned off by your ISP in the first place...

Ramin



On Wed, Jul 16, 2003 at 11:58:28AM -0700, Daniel Chemko wrote:

> I am getting some disturbing packet traffic hitting my firewall. Here
> goes:
> 
>  
> 
> IN=eth4 OUT=eth5 SRC=24.87.243.251 DST=24.57.108.11 LEN=76 TOS=0x00
> PREC=0xC0 TTL=25
> 
> 4 ID=17431 PROTO=ICMP TYPE=3 CODE=3 [SRC=24.57.108.11 DST=24.87.243.251
> LEN=48 TOS=0x00 PREC=0x00 TTL=117 ID=15860 DF PROTO=TCP SPT=
> 
> 3161 DPT=80 WINDOW=16384 RES=0x00 SYN URGP=0 ]
> 
>  
> 
> None of the addresses listed in the packets are from my networks, but
> what is more disturbing is that eth4 is my internal network interface.
> Can anyone see (baring an internal intrusion has occurred) how this can
> happen?
> 
>  
> 
> It definitely appears to be an exploit on my configuration or something.
> 
>  
> 
>  
> 

