From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: whois
Date: Fri, 27 Sep 2002 07:56:11 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209270753050.1116-100000@grignard.amagerkollegiet.dk>
References: <20020926183743.A2461@efn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020926183743.A2461@efn.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Roger <roger@efn.org>
Cc: netfilter@lists.netfilter.org

On Thu, 26 Sep 2002, Roger wrote:

>
> I'm having problems setting a rule to allow 'whois' queries.
> With the following:
> iptables -A OUTPUT  -o eth+ -p tcp --dport 43 -m state --state
> NEW,ESTABLISHED -j ACCEPT
>
> iptables -A INPUT -i eth+ -p tcp --sport 43 -m state --state ESTABLISHED
> -j ACCEPT
>
> with any unmatching being logged, there is a log entry for inbound tcp to
> port 43

Yes, because you do not allow incoming return packets with source port
43. I would do:

iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 43 --syn -j ACCEPT

All of this assuming that you are running whois from the firewall itself
(else you would have to put the rules in FORWARD).

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
To alcohol!
The cause of - and solution to - all of life's problems!
                                        -- Homer Simpson
----------------------------------[ moffe at amagerkollegiet dot dk ] --


