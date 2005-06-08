From: Guenter.Sprakties@team4.de
Subject: Re: Stateless NAT
Date: Wed, 8 Jun 2005 08:56:55 +0200
Message-ID: <OF7FD36B55.0277057F-ONC125701A.00258ADF-C125701A.00262725@team4.de>
References: <42A64C94.6010405@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A64C94.6010405@linuxmail.org>
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
Content-Transfer-Encoding: 7bit
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter-bounces@lists.netfilter.org, NetFilter <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org schrieb am 08.06.2005 03:40:36:

> 
> > I appreciate any suggestions on how I could correct my setup so I can
> > use stateless.
> > 
> 
> You don't use netfilter. You use iproute2.
> 
> http://linux-ip.net/html/nat-stateless.html
> 

First your right, iproute2 is the best tool managing simple 1:1 NAT. 

Second, is doesn't work because some guys decided to remove the necessary 
code out of the kernel.
So you HAVE to use netfolter, and I tell you:

First again, it didn't work. Second, no one of the guys out there helps 
you. I tried to get help, but nothing happend.
I think, natting is against their religion or something like this.

Take an old kernel and use iproute2, the most genial tool in all the net 
stuff.
