From: Askar Ali Khan <askarali@gmail.com>
Subject: TOS benefits
Date: Tue, 10 Aug 2004 00:46:42 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040809114644633ce4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

hi all,

Heh lot reading today :) i duno why the guy started Netfiter Vs
Commercial thingy?
However I would love to add "Open Source is the clear winner
today..and tomm.. and also open source is what we "third world" can
afford :P.

Oops sorry, here is my question I just want to know im doing the below
on our company firewall, that Type of Service bit things.
My question is that
1) Is this beneficial for protocol like MSN and yahoo?

I check alot again and again sign in yahoo and msn, however im not
sure whether it give me a 4 to 5 second fast signin on yahoo and msn,
coz @ work we gota LAN where sometime these IM signin fast and
sometime take few seconds more then normal.

#### TOS Mangling##############
## For MSN thingy
iptables -I PREROUTING -t mangle -p tcp --dport 1863 -j TOS --set-tos
Minimize-Delay
## For Yahoo thingy
iptables -I PREROUTING -t mangle -p tcp --dport 5000:5050 -j TOS
--set-tos Minimize-Delay
## For 443 thingy
iptables -I PREROUTING -t mangle -p tcp --dport 443 -j TOS --set-tos
Minimize-Delay
## For DNS thingy
iptables -A PREROUTING -t mangle -p udp --dport 53 -j TOS --set-tos
Minimize-Delay

Thanks in advance
regards
Askar

