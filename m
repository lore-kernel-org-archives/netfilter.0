From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: syn DDoS attack solution
Date: Fri, 1 Jun 2007 20:09:10 -0300
Message-ID: <20070601200910.0800d23d@babalu.inexo.com.br>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu> <007101c7a45d$bc50e380$34f2aa80$@COM>
	<466090CA.2050806@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466090CA.2050806@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 01 Jun 2007 23:34:02 +0200
Martijn Lievaart <m@rtij.nl> wrote:

> > Then your original description was incorrect or at least inadequate. It has
> > nothing to do with SYN as originally suggested since an ESTABLISHED
> > connection has blown past SYN, through SYN/ACK and by ACK. It has completed
> > the TCP handshake, as you note above. A SYN attack/flood would stop after
> > sending the initial SYN and leave the connection half-open to exhaust the
> > half-open buffers.
> >   
> 
> An connection is in the ESTABLISHED state once a packet has been seen. 
> So once the SYN is seen, the state is ESTABLISHED.

I think you meant "So once the SYN is seen, the state is NEW".

The state will change to ESTABLISHED as soon as netfiletr sees the SYN+ACK
response.

My 2 cents.
Cheers.

Ethy



