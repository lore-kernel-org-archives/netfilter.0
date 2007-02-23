From: "Andres Baravalle" <andres.baravalle@gmail.com>
Subject: Re: problems with port forwarding
Date: Fri, 23 Feb 2007 18:19:28 +0000
Message-ID: <45992f580702231019l4c115a4awb84234b1cf04189a@mail.gmail.com>
References: <45992f580702230807p39f8fcacr914ef910270ae2ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=I1qHpZz+bBhWQjwXou2yPHxZ9U1yLcRTertARxNmeYNVjmJzpW7biUylLr7p+40Tv4hl/GtI7cz0P/TnMaxNikb1PD2X4ZtHIoNBUPu+EW/trC8PC+BaXYr70M102eMUHDXGvya0wZbkaTGttqVrD4KdfmzDTTk13WbA0wAydNg=
In-Reply-To: <45992f580702230807p39f8fcacr914ef910270ae2ba@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

2007/2/23, Andres Baravalle <andres.baravalle@gmail.com>:
> iptables -L FORWARD
>
> Chain FORWARD (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> REJECT     tcp  --  anywhere             anywhere            tcp
> flags:!SYN,RST,ACK/SYN reject-with tcp-reset
> DROP       all  --  anywhere             anywhere            state INVALID
> ACCEPT     tcp  --  anywhere             SERVER_B    tcp dpt:10022
> ACCEPT     all  --  anywhere             anywhere
> LOG        tcp  --  anywhere             SERVER_B    LOG level warning
>
> If I connect from server A to localhost, port 10022, it works. If I
> connect from any other machine to server A, port 10022, it doesn't.

Apparently the problem is in the FORWARD chain.

If I set the default policy to ACCEPT, it will work:

iptables -L FORWARD

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             SERVER_B      tcp dpt:10022
REJECT     tcp  --  anywhere             anywhere            tcp
flags:!SYN,RST,ACK/SYN reject-with tcp-reset
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     all  --  anywhere             anywhere

But I don't feel too comfortable having ACCEPT has default value. Any
suggestions?

   Andres

