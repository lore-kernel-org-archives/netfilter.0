From: <mlody@elpec.com>
Subject: Re: Help with alias interfaces
Date: Mon, 21 Jun 2004 20:22:45 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2317.82.160.70.13.1087842165.squirrel@www.elpec.com>
References: <003301c457b2$d516e860$1930090a@paol>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c457b2$d516e860$1930090a@paol>
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

> Hello
> Try this:
> ip link set eth0:x name shit1
> 
> and then...
> iptables -A FORWARD -i shit1 -do something
> 
> 

I did "ip link set eth0:1 name ble1" and I get respond: "SIOCSIFNAME: 
Device or resource busy"

eth0 is up and eth0:1 is down. Where is the hatch?

Robert


