From: Les Mikesell <les@futuresource.com>
Subject: Re: Blocking IP
Date: Thu, 29 Jul 2004 07:28:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091104096.9267.4.camel@les-home.futuresource.com>
References: <5.1.0.14.2.20040602145807.00b74bf8@pop3.netcologne.de>
	 <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c47565$8e0ba110$858310ac@suarapembaruan.com>
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
To: david <david@suarapembaruan.co.id>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-07-29 at 07:14, david wrote:
> Dear all,
> 
> My mail server received so many virus mails from ip 202.145.10.147 and after
> i look at gateway (linux) and i using iptraf i see so many traffic from
> 202.145.10.147.
> After that i try to block all traffic from 202.145.10.147 with command :
> #iptables -A INPUT -s 202.145.10.146 -j DROP
> 
> but i still receiveall traffic from 202.145.10.146......

It might be as easy to block traffic with route as iptables:
route add -host 202.145.10.146 reject
should stop it (actually it stops your ability to respond
but for tcp that's enough).

---
  Les Mikesell
   les@futuresource.com


