From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ftp
Date: Thu, 27 May 2004 18:43:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040527164327.6B8A1DBD@sterenborg.info>
References: <117001c44406$bbca33e0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <117001c44406$bbca33e0$49caa8c0@caris.priv>
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


