From: Samuel =?iso-8859-1?B?RO1heiBHYXJj7WE=?= <samueldg@arcoscom.com>
Subject: Re: block ssh and ping
Date: Tue, 08 Feb 2005 13:15:12 +0100
Message-ID: <20050208121512.32686.qmail@arcoscom.com>
References: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e36ca5e45b4.5e45b45e36ca@vsnl.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: varun_saa@vsnl.net
Cc: netfilter@lists.netfilter.org

iptables -t filter -I INPUT -i eth0 -p icmp --icmp-type 8 -j DROP
iptables -t filter -I INPUT -i eth0 -p tcp --dport ssh -j DROP 

varun_saa@vsnl.net writes: 

> Hello,
>       My server is Mandrake 10.1
> eth0 is WAN with static IP connected to 512k DSL
> eth1 is LAN. 
> 
> 1. I would like to block ping to my external static IP 
> 
> 2. I would like to block ssh to my external static IP 
> 
> Howto to do that ? 
> 
> Thanks 
> 
> Varun 
> 
> 
 


Samuel D=EDaz Garc=ED=ADa
Director Gerente
ArcosCom Wireless, S.L.L. 

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn.: 956 70 13 15
fax:   956 70 34 83 



