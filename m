From: Roger <roger@efn.org>
Subject: whois
Date: Thu, 26 Sep 2002 18:37:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020926183743.A2461@efn.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'm having problems setting a rule to allow 'whois' queries.
With the following:
iptables -A OUTPUT  -o eth+ -p tcp --dport 43 -m state --state 
NEW,ESTABLISHED -j ACCEPT

iptables -A INPUT -i eth+ -p tcp --sport 43 -m state --state ESTABLISHED 
-j ACCEPT

with any unmatching being logged, there is a log entry for inbound tcp to 
port 43

I was under the impression that since I'm originating the request, then 
the input should come through since it is an established connection.  If I 
modify the INPUT rule to allow NEW,ESTABLISHED then it works.

other services that I have set up in a similar fashion seem to work.

Any idea what's going on?

tia.
Roger

-- 

