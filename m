From: Thorsten Scherf <tscherf@arcor.de>
Subject: Re: ready to cry over NATting!
Date: 22 May 2003 01:38:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053560327.1209.15.camel@kermit.esecurity.local>
References: <20030520102957.GA98543@justpickone.org>
	 <1053440382.1993.117.camel@kermit.spenneberg.de>
	 <20030520155813.GA33081@justpickone.org>
	 <1053451097.27975.136.camel@kermit.spenneberg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053451097.27975.136.camel@kermit.spenneberg.de>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: David T-G <davidtg-netfilter@justpickone.org>, NetFilter Users' List <netfilter@lists.netfilter.org>

> Yes. But if you just want to allow ssh and web do the following:
> # Allow ssh and web access to the firewall box
> iptables -t filter -A INPUT -i $EXTIF -m match NEW,RELATED,ESTABLISHED
> -j ACCEPT
> # Allow the firewallbox to answer
> iptables -t filter -A OUTPUT -o $EXTIF -m match RELATED,ESTABLISHED -j
> ACCEPT

for allowing only ssh and web the incoming rule should be:
iptables -t filter -A INPUT -i $EXTIF -p tcp -m multiport --dport
80,443,22 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

Greetings,
Thorsten 


-- 
Thorsten Scherf,
RHCE, RHCX

GPG-Key 1024D/FFD73659 
Fingerprint: 6ADE D9C6 CB90 958F BDBE  8D2E EAE8 4FE6 FFD7 3659


