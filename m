From: Tomasz Korycki <engine2@flow.mine.nu>
Subject: Some go through, some don't...
Date: Fri, 15 Nov 2002 00:34:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.0.20021115001532.00a071f0@mail.flow.north.net>
References: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20021114211658.02688eb8@of23sm3>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have a four-armed router with netfilter on it. There are two internal 
networks: let's call them
A.B.x.y and E.F.G.x.. The inside interfaces will be A.B.129.1 and E.F.G.246.
The two outside interfaces: let's call them 1.2.3.4 and 5.6.7.8, but they 
do not matter

On host E.F.G.250 (which I'm on right now) I want to connect to a CVS on 
A.B.1.65. I can't.
I could earlier on today. Hm. I dial-up the CVS - everything fine there. I 
go back to a terminal here,
try to ping A.B.1.65 - I get answers. But traceroute comes back with 
E.F.G.246 - !H, host unreachable.
Interesting. Looks like the router can't reach CVS. I log onto the router 
and ping CVS - all clear.
I then traceroute it - fine. I notice that (of course) when I ping, source 
address if A.B.129.1 - which is right.
So I try ping -I E.F.G.246, which is "my" side of the router - everything 
is fine. But then I notice in the logs
that I get a slew of messages: Neighbour table overflow. That's a routing 
message, so I figure, I'll try
to send a "keepalive" while I continue testing, so I do
ping -i 60 A.B.1.65 and go on my merry way. Then I notice, that ping comes 
back with a response for
pings sent from the A.B.129.1, then, a few seconds later, prints
 From <hostname> E.F.G.246: Destination host unreachable.

But I did see replies sent from that interface!

Well, since there is netfilter on it (and no routed or gated) - can it be 
responsible for this odd
behaviour? iptables -L -n shows nothing suspicious, basic ICMP is allowed 
from anywhere,
all traffic is allowed from E.F.G.x, A.B.x.y -> E.F.G.x only related and so on.

I was going to put the -L -n output here, but considering the size I will 
not, unless asked...



