From: Jack Bowling <jbinpg@shaw.ca>
Subject: Re: SNAT of ICMP fragmentation-nee
Date: Mon, 10 Jun 2002 09:06:41 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0GXH0068QZEYYV@l-daemon>
References: <Pine.LNX.4.44.0206101340570.30649-100000@albert.ha-vel.cz>
 <200206101218.g5ACIKU08127@vulcan.rissington.net>
Reply-To: Jack Bowling <jbinpg@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206101218.g5ACIKU08127@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: netfilter@lists.samba.org

** Reply to message from Antony Stone <Antony@Soft-Solutions.co.uk> on Mon, 10 Jun 2002 13:18:12 +0100


> On Monday 10 June 2002 12:45 pm, jakub@angel.cz wrote:
> 
> > :) this is really not the problem, now I am logging all packets, no adress
> >
> > specification ;)
> >
> > -A POSTROUTING -p icmp -m icmp --icmp-type 3/4 -j LOG --log-prefix "icmp
> > SNAT POST "
> 
> Hmmm.   Okay - this is beyond my understanding of netfilter - can anyone else 
> suggest why icmp packets going through the machine would get logged and 
> processed by PREROUTING and FORWARD but not by POSTROUTING ?

Wouldn't hurt to add the interface(s).

jb

-- 
Jack Bowling
mailto: jbinpg@shaw.ca

