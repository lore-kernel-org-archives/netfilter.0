From: <mlody@elpec.com>
Subject: Re: Help with alias interfaces
Date: Mon, 21 Jun 2004 21:15:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2133.217.97.240.4.1087845316.squirrel@www.elpec.com>
References: <000901c457bf$c674a600$1930090a@paol>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c457bf$c674a600$1930090a@paol>
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

> Try ifconfig eth0:1 down and delete ip's from that interface and then "ip
> link set eth0:1 name ble1"
> ----- Original Message ----- 
> From: <mlody@elpec.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, June 21, 2004 8:22 PM
> Subject: Re: Help with alias interfaces
> 
> 
> > > Hello
> > > Try this:
> > > ip link set eth0:x name shit1
> > >
> > > and then...
> > > iptables -A FORWARD -i shit1 -do something
> > >
> > >
> >
> > I did "ip link set eth0:1 name ble1" and I get respond: "SIOCSIFNAME:
> > Device or resource busy"
> >
> > eth0 is up and eth0:1 is down. Where is the hatch?
> >
> > Robert
> >
> >
> >
> >
> 
> 
> 
 The problem is that eth0:1 is down. Unless you men eth0 is to down...

Robert



