From: Jarek Sobieszek <j.sobieszek@lart.pl>
Subject: Re: loopback and pointopoint interfaces
Date: Thu, 30 Jan 2003 17:45:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130164500.GG10850@localhost.localdomain>
References: <20030130110035.GA3701@localhost.localdomain> <20030130143348.GC8060@localhost.localdomain> <20030130143554.GE8060@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030130143554.GE8060@localhost.localdomain>; from j.sobieszek@lart.pl on Thu, Jan 30, 2003 at 15:35:54 +0100
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

> iptables -A POSTROUTING -t nat -d 10.1.1.11 -j SNAT --to 10.1.1.3
> iptables -A POSTROUTING -t nat -d 10.1.1.12 -j SNAT --to 10.1.1.4

It should have been:

iptables -A POSTROUTING -t nat -d 10.1.1.11 -j SNAT --to 10.1.1.13
iptables -A POSTROUTING -t nat -d 10.1.1.12 -j SNAT --to 10.1.1.14

Previously the packets were dropped by fib_validate_source.

Jarek Sobieszek

