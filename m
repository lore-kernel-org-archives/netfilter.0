From: Philip Craig <philipc@snapgear.com>
Subject: Re: iptables limit-burst trouble
Date: Tue, 10 Jun 2003 14:35:26 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EE5600E.8040201@snapgear.com>
References: <20030609111735.C484.ACROYEAR@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030609111735.C484.ACROYEAR@gmx.ch>
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
To: Tsuyoshi Takada <acroyear@gmx.ch>
Cc: netfilter@lists.netfilter.org

Tsuyoshi Takada wrote:
> I want to limit Web DoS attack.
> 
> I have set the following but it does not work well.
> 
> iptables -N flood-chk
> iptables -A INPUT     -p tcp --dport 80 --syn -j flood-chk
> iptables -A flood-chk -m limit --limit 1/sec --limit-burst 2 -j RETURN
> iptables -A flood-chk -j LOG --log-prefix "IPTABLES HTTP FLOOD-PACKET"
> iptables -A flood-chk -j DROP
> 
> After I accessed to my web site,
> I pushed reload button of my web browser repeatedly but 
> I was not denied by iptables.
> Why?

These rules work for me.  Note however that if you hit the limit,
your browser will automatically retransmit and succeed if it is at
least 1 second later.  You should notice a delay in loading the
page when the browser has to retransmit.  You should also get the
syslog message.

If you change the DROP to a REJECT, then your browser will display
'connection refused' when it reaches the limit, rather than
retransmitting.  (Using REJECT isn't good for protection against
a DoS attack though, just do this for testing that the rules
are working.)

I would also recommend putting a limit on the rule for the LOG
message, otherwise it is possible to flood your logs.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


