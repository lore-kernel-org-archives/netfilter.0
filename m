From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Fwd: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 15:04:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F6E35D.4090007@pbl.ca>
References: <20040715195526.1368.qmail@web40709.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715195526.1368.qmail@web40709.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Real Cucumber wrote:
> I do have a state rule already for allowing any
> established,related connections.
> 
> So should I add another one such as:
> 
> iptables -A FORWARD -p icmp -m state --state RELATED
> -j ACCEPT
> 
> The current ruleset is attached (I've only excluded
> the variables and logging sections of it).
> 
> # Allow previously initiated and accepted connections
> # to bypass firewall tests (state matching)
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

If you have this three generic rules, you don't need separate rule just 
for ICMP.  The generic rule will match all IP protocols (tcp, udp, and 
icmp).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

