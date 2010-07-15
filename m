From: Mike C <smith.not.western@gmail.com>
Subject: Logging IP packets without L4 payloads
Date: Thu, 15 Jul 2010 17:49:30 +0100
Message-ID: <AANLkTin42ZEi4pp95JOqQKa2FbjBZ2C6q1iKmRmLUk9M@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=cGl2aoEiF1M5FEr9NChRHGgsBTDBpCBqguJlq8ssHhk=;
        b=ZJ3zNIpU2alvrlSCL94vpy3lvS5Kro6k3yxRd1pIQeFNIab4dhzdsluHxaR3s8GLkk
         HyKkw6q3/BG/zxOXLRVfsgCX+uE51CJrsqnODuKWiSLgVg/DOLXtiYDNER/wlxzj6+fK
         /c8ZtBY93L6pqgdWKTwAqQDg5sIHEb7mplzgY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm seeking advice on how to log an IPv4 packet with no transport
layer - no ICMP/TCP/UDP/etc... layer, though the IPv4 header does
specify the protocol field as such. I'm using sendip to generate such
packets, in this case an IP packet with protocol specified as UDP but
no UDP header nor payload (and .1 = pc, .254 = firewall): sendip -p
ipv4 -is 192.168.1.1 -id 192.168.1.254 -ip 17 -v 192.168.1.254

Assume the last rule in my mangle PREROUTING table is to log the
packet with the LOG target.

In mangle I have a rule:

iptables -t mangle -I PREROUTING -p udp --dport 53 -j TOS --set-tos
Minimize-Delay

It seems that inspecting an IP packet as malformed as the one I am
sending causes this rule to silently 'consume' the packet, and it
fails to be processed by any more rules.

If I change the rule to just specify udp, and not inspect the port
(which obviously isn't there because there is no L4 payload) then
everything works well:

iptables -t mangle -D PREROUTING -p udp --dport 53 -j TOS --set-tos
Minimize-Delay
iptables -t mangle -I PREROUTING -p udp -j TOS --set-tos Minimize-Delay

So something about specifying a port is giving it grief - it's not
gracefully handling the lack of UDP header well. I've tried the same
using TCP instead of UDP and experience identical results.

My question is how can I best approach logging (and not processing any
further) packets as malformed as the ones I've described above? I have
observed that checking if the state is INVALID seems to filter out the
packets nicely, assuming it's called before any rule that inspects L4
fields:

iptables -t mangle -I PREROUTING -m state --state INVALID -j DROP_AND_LOG
where DROP_AND_LOG is another chain that does what it say (-j LOG, -j DROP)

However I've never tested state in mangle before - only ever in
filter. I'm unsure if this approach is sound or if it is likely to
introduce problems. From my casual observations today it seems to work
fine - however I haven't tested exhaustively yet.

Is there a better approach to the problem?
Am I safe to use '-m state --state INVALID' in mangle?
Is there a bug in the way iptables handles L4 processing? (I've
noticed the same bug with rules using multiport as well) If a rule
cannot match the condition should it not more onto the next rule to
test against?

iptables 1.4.7
linux kernel 2.6.32.9

Regards,

Mike C.
