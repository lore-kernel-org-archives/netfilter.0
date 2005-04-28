From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How to stop the flood?
Date: Thu, 28 Apr 2005 17:47:53 +0200
Message-ID: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>
References: <00c701c54c01$3ba1b9a0$3b3429c4@rp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c701c54c01$3ba1b9a0$3b3429c4@rp>
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

netfilter-bounces@lists.netfilter.org <> scribbled on Thursday, 28 April
2005 16:48:

> Thankyou for the reply.
> 
> This was the log from one of my client who was attacked from a client
> on other subnet. 
> 
> My network consist of clients from different subnets of /24.
> 
> The attacks from one subnet travels through my linux router
> and hits the client on other subnet.
> 
> I tried few rules as below but seems not to be working.

The script doesn't block any packets from 192.168.25.208.
If 192.168.25.208 isn't allowed passing your router, you should block it
:

$IPT -A FORWARD -s 192.168.25.208 [-d <destination_ip>] \
  -j [DROP|REJECT --reject-with-tcp-reset]

Or something like that.

The real solution is like Jason said : track down the person at
192.168.25.208 and kick his/her ass !


Gr,
Rob


