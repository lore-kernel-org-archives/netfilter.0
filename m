From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT of ICMP fragmentation-nee
Date: Mon, 10 Jun 2002 13:18:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206101218.g5ACIKU08127@vulcan.rissington.net>
References: <Pine.LNX.4.44.0206101340570.30649-100000@albert.ha-vel.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.44.0206101340570.30649-100000@albert.ha-vel.cz>
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

On Monday 10 June 2002 12:45 pm, jakub@angel.cz wrote:

> :) this is really not the problem, now I am logging all packets, no adress
>
> specification ;)
>
> -A POSTROUTING -p icmp -m icmp --icmp-type 3/4 -j LOG --log-prefix "icmp
> SNAT POST "

Hmmm.   Okay - this is beyond my understanding of netfilter - can anyone else 
suggest why icmp packets going through the machine would get logged and 
processed by PREROUTING and FORWARD but not by POSTROUTING ?


Antony.

