From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: ftp
Date: Thu, 27 May 2004 14:59:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <119801c44414$60dc9500$49caa8c0@caris.priv>
References: <20040527164327.6B8A1DBD@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

I actually don't need the dnat as I have internet routable ip's in my dmz
.... Thank you for the info.  My question now is, will your rule take care
of both passive and active ftp ?  I would prefer to just use active .. but I
know many clients would have their own issues .. grr .. stupid ftp ....

Peter.

----- Original Message ----- 
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, May 27, 2004 1:43 PM
Subject: RE: ftp


> Sorry to post the same question again .... I am at a loss as
> to what to put for rules for my ftp server (which is behind
> the firewall).
> I know they go on the forward chain ....
> There are going to be people connecting to it with a username
> / password and also anonymously from outside ...
>
> My main question I guess is should I set it up for passive or
> active transfers ....
> Or, does the RELATED option take care of those problems >

Use ip_conntrack_ftp and ip_nat_ftp.
Something like (with information from your previous post) :

modprobe ip_conntrack_ftp
modprobe ip_nat_ftp

$IPT -P FORWARD DROP
$IPT -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A FORWARD -i eth0 -o eth1 -d <ip_ftpsvr> -p tcp \
  --dport 21 --j ACCEPT
$IPT -t nat -A PREROUTING -i eth0 -p tcp --dport 21 \
  -j DNAT <ip_ftpsvr>


Gr,
Rob



