From: <dummy1@gazeta.pl>
Subject: Re: Masquerade stopped working?!?!
Date: Sun, 03 Aug 2003 20:12:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059934343831.ew5.dummy1@gazeta.pl>
References: <200308031332.12304.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308031332.12304.Alistair@nerdnet.ca>
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

> > box. I have done logging:
> > iptables -A FORWARD -o eth0 -j LOG
> > and the results are like this:
> > IN=eth1 OUT=eth0 SRC=10.1.1.14 DST=212.77.100.101 LEN=60 
TOS=0x00
> > PREC=0x00 TTL=63 ID=24078 DF PROTO=TCP SPT=32777 DPT=80 
WINDOW=2144
> > RES=0x00 SYN URGP=0
> > I have added logging incoming packets:
> > iptables -A INPUT -i eth0 -j LOG
> > and... silence. No packet are coming back.
> 
> If the packets LEFT via the FORWARD chain, they should come BACK 
through the
>  FORWARD chain (if nat is working).  if you used -A to add the 
logging rule in
> the FORWARD chain
>         it is the last rule in the chain.
>  try
>         iptables -I FORWARD 1 -o eth0 -j LOG --log-prefix 
Forward_out:
>  iptables -I FORWARD 1 -i eth0 -j LOG --log-prefix Forward_in:
> 
>  (unnnnhhh someone doublecheck the syntax on that for me .. I'm 
half asleep)
> 
>  to catch packets in BOTH directions on the FORWARD chain.

You are right so I correct logging rules using your tips, but logs 
still say that packets are going in one direction:
Forward_out:IN=eth1 OUT=eth0 SRC=10.1.1.14 DST=212.126.20.69 LEN=48 
TOS=0x00 PREC=0x00 TTL=127 ID=4252 DF PROTO=TCP SPT=1116 DPT=80 
WINDOW=16384 RES=0x00 SYN URGP=0
and no logs with prefix Forward_in: :-(





