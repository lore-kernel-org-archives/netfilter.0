From: rrecaba@usb.ve
Subject: Double Match or jump (was Re: detect original chain after jump?)
Date: Sun, 28 Mar 2004 21:27:25 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0403281955110.8682-100000@anis.dst.usb.ve>
References: <200403271514.07236.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403271514.07236.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello again,

So i decided to ask this again cause it is actually not related to the
original post...

Supose I want to log and drop a packet with certain criteria. Actually,
imagine that I want to send the logged info to a program in userspace. I
have seen recommendations in the lines of:

iptables <whatever> <MATCH> -j ULOG
iptables <whatever> <MATCH> -J DROP

That is doing a double match. So I wanted to ask: has anyone done any
experimentation to see when exactly is it better to do another chain,
call it "temp", to do the ULOG and DROP unconditionally, and call it from
a single one that does the match?

iptables <whatever> <MATCH> -j temp

iptables -A temp -j ULOG
iptables -A temp -j DROP

Of course, it cant be related to the final jumps, so I would expect the
drop and ulog not being important. I would conjecture that what is important
is the actually the MATCH. If the MATCH is very complex, is it
better to go the second way. Has anyone done experiments on this?

The reason this is important to me is because I am working on a user level
program that is supposed to analize and generate rules dynamically. I am
working on a very general multipurpose language and specification... so, I
want to be able to decide what kind of rules I am suppose to generate in
different scenarios ... kind of like bringing iptables alive... or
actually giving it a life of its own... :)

Regards,
Ruben.


