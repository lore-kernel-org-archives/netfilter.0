From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: accept rule not working.
Date: Wed, 7 May 2008 17:29:28 +0200
Message-ID: <001101c8b057$23a5c950$6af15bf0$@info>
References: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805071514.m47FEhxC008001@indigo.cs.bgu.ac.il>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eial@cs.bgu.ac.il, netfilter@vger.kernel.org

> I've created this rule:
> /sbin/iptables -A INPUT -i eth0 -p tcp -m state --state NEW --sport
> 80 -s 192.168.113.94 -j ACCEPT
> 
> but the firewall still blocks it, I guess there is a typo somewhere
> but I cant seem to be able to find it any hints?

Since the packets are still dropped, either the rule doesn't match the packets you expect it to match, or another blocking rule matches before it can be accepted by this one.

Also, you're using "--sport 80". Are you sure the packets are COMING FROM source port 80 instead of GOING TO port 80 (--dport 80)?


Grts,
Rob


