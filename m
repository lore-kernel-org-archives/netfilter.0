From: Pascal Italiaander <pc-secure@home.nl>
Subject: Re: Snuffing out hackers
Date: Fri, 1 Aug 2003 08:50:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308010850.55270.pc-secure@home.nl>
References: <7C9884991ADAE0479C14F10C858BCDF5122DF6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DF6@alderaan.smgtec.com>
Content-Disposition: inline
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

Op woensdag 16 juli 2003 20:58, schreef Daniel Chemko:
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


To snif out hackers , to watch their activities, or block them ,you could put 
a bridge in front of your firewall ( OpenBSD perhaps ).
Since the bridge has no IP-address no hacker noticed that you're watching, or 
has no clue what blocks him. Even better , the bridge can not be attacked or 
hacked. ( since there is no ip-address the bridge is NOT seen as a part of 
youre network , no extra HOP is seen, makes it almost invissible  )

Some advanced method could be a honeypot.


This can give you more output about attacks or whatever an intruder wants to.  

Pascal

