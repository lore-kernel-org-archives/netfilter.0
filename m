From: Karl Fischer <karl.fischer@quantum.com>
Subject: Re: DNAT in OUTPUT chain
Date: Thu, 27 Jun 2002 22:37:04 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1B7770.78F1647@quantum.com>
References: <FIEPIOLBGHKEOJANBEKMKELHCCAA.dk@webcluster.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: dk@webcluster.at
Cc: Netfilter mailing list <netfilter@lists.samba.org>

Daniel Khan wrote:
> 
> Hello List,
> 
> I have a Problem with NAT on RedHat 7.3/iptables v1.2.5.
>
> So I use exactly the syntax from the HOWTO's:
> 
> iptables -A OUTPUT -t nat -p tcp --dport 3306 -j DNAT --to 10.1.0.212:3306

I just copied and pasted this line to my machine and it works fine here.
However, according to the man-page, I would try the following:

iptables -A OUTPUT -t nat -p tcp -m tcp --dport 3306 \
  -j DNAT --to-destination 10.1.0.212:3306

HTH

- Karl

