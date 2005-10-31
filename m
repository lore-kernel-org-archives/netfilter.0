From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: what's the problem of DNAT
Date: Mon, 31 Oct 2005 15:58:08 +0800
Message-ID: <43a0cdcb0510302358y10f854ffg@mail.gmail.com>
References: <43a0cdcb0510301931p3f97ff66p@mail.gmail.com>
	<Pine.LNX.4.61.0510310758150.11251@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510310758150.11251@filer.marasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

> Any other rules in PREROUTING on port 80?
>
> iptables-save -t nat

-A PREROUTING -d Inet1 -p tcp -m tcp --dport 6100 -j DNAT
--to-destination 192.168.16.21:6100
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 192.168.16.114:80
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 20 -j DNAT
--to-destination 192.168.16.114:20
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 8081 -j DNAT
--to-destination 192.168.16.100:8081
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 8082 -j DNAT
--to-destination 192.168.16.100:8082
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 8085 -j DNAT
--to-destination 192.168.16.100:8085
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 8083 -j DNAT
--to-destination 192.168.16.100:8083
-A PREROUTING -d Inet1 -p tcp -m tcp --dport 8087 -j DNAT
--to-destination 192.168.16.100:8087

these are the rules in PREROUTING. the Inet1 replaced for the  =20
internet address. Now it only can connect to Inet1:80 through the
internet. and others like :Inet1:8083 can't be accessed.
    It worked months ago . but now it don't work anyway

