From: =?iso-8859-2?Q?Pawe=B3_Staszewski?= <pstaszewski@artcom.pl>
Subject: Re: Help with alias interfaces
Date: Mon, 21 Jun 2004 20:44:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c457bf$c674a600$1930090a@paol>
References: <003301c457b2$d516e860$1930090a@paol> <2317.82.160.70.13.1087842165.squirrel@www.elpec.com>
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
To: netfilter@lists.netfilter.org

Try ifconfig eth0:1 down and delete ip's from that interface and then "ip
link set eth0:1 name ble1"
----- Original Message ----- 
From: <mlody@elpec.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, June 21, 2004 8:22 PM
Subject: Re: Help with alias interfaces


> > Hello
> > Try this:
> > ip link set eth0:x name shit1
> >
> > and then...
> > iptables -A FORWARD -i shit1 -do something
> >
> >
>
> I did "ip link set eth0:1 name ble1" and I get respond: "SIOCSIFNAME:
> Device or resource busy"
>
> eth0 is up and eth0:1 is down. Where is the hatch?
>
> Robert
>
>
>
>



