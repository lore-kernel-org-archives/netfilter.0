From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Question about fiewall script....
Date: Thu, 2 Jan 2003 00:25:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKAENPLLAA.rsterenborg@xs4all.nl>
References: <001601c2b13c$41954190$6501a8c0@athlon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c2b13c$41954190$6501a8c0@athlon>
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

> if [ "$CONNECTION_TRACKING" = "1" ]; then
> 	$IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 \
> 	-d <Internet Address> --dport $UNPRIVPORTS -m state \
> 	--state NEW -j ACCEPT
> fi
> $IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 -d <Internet
> Address> \
> --dport $UNPRIVPORTS -j ACCEPT
> $IPTABLES -A OUTPUT -o $EXTIF -p tcp ! --syn -s <Internet
> Address> \
> --sport $UNPRIVPORTS --dport 20 -j ACCEPT

> If I understand his thinking properly, this statement is supposed to
> check to see if the "Connection Tracking" module of IPTABLES/
> NetFilter is loaded and if so, use the rule defined inside of the
> if/fi section.  But if the "Connection Tracking" module isn't
loaded,

Yes. But as Joel said : you have to set $CONNECTION_TRACKING to 1 in
your script else it will never be executed.

> the firewall will fallback to the rules that follow, allowing the
proper
> traffic to flow anyway.  This is supposedly because the "Connection

There is no fallback when $CONNECTION_TRACKING != 1 in this piece of
the script. If $CONNECTION_TRACKING = 1 the if/fi gets executed, else
not.
The lines below if/fi will be executed regardless of the value of
$CONNECTION_TRACKING.
If there was a fallback for $CONNECTION_TRACKING, you would probably
see an if/then/else/fi structure.


Rob


