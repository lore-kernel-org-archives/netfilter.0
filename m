From: "Jolyon Gray" <ug82jxg@cs.bham.ac.uk>
Subject: university project: distributed firewall (using iptables)
Date: Wed, 27 Oct 2004 15:35:52 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <ECOWS04M9d0yPAWIeSN00016177@smtp-out4.blueyonder.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

 

I'm currently undertaking a final year project at university. My chosen
project is to develop a distributed firewall application - I intend to use a
centralised security policy which is applied to hosts as they enter the LAN
- using iptables to do the packet filtering.

 

Iptables seems pretty straightforward but I'm having trouble with a few
concepts - I'm probably just missing the mark:). I wish to use java as the
implementation language - what are people's thoughts on this? I'll probably
code my own classes to mirror the functionality of iptables - e.g. table,
chain, target etc. These would subsequently be used to create the rules in
text form - just a matter of applying them! The user would create the
central policy using some GUI, specifying which machines are able to talk to
which server ports etc - the rules for each machine would be created and
applied via some sort of service. I'll probably use certificates for host
authentication - if the machine cannot provide the correct credentials the
central policy server fires out iptables rules to all authd machines to
block the imposter!

 

I'm intending to use a block unless explicitly allowed approach, originally
I was thinking say if machine x could speak to ftp on server y that I'd
adjust both x and y's rules to set this up - however now I'm thinking that
who cares about x, if y accepts ftp connections from x then all good but if
not then y will block x so no need to tell x:)? Also, if x is not a server
therefore x would not need to accept any incoming connections just make
outgoing connections and receive their information therefore I could block
all incoming connections to x unless they match an outgoing connection. - is
that a dumb idea;)?

 

However I'd like to have some functionality beyond this, for example I'd
like to have some way of recognising when a user launches an application
requiring internet access - and update the rules accordingly (if the central
policy for that user allows it!) - how would you do application level
blocking using iptables, is this even possible or is Iptables too low level
for that?. Furthering that I'd like to have individual rules for each user -
however am I correct in thinking that iptables rules are per machine not per
user - they affect all users of that machine; does anyone have ideas on a
solution to allow multiple logon machines to have user level rules?

 

Please tell me if I'm crazy trying to create a distributed firewall using
iptables :)!

 

Regards,

Jolyon Gray

