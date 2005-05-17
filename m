From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: redirect to 127.0.0.1 [corrected]
Date: Tue, 17 May 2005 13:57:05 -0500
Message-ID: <428A3E81.3030301@riverviewtech.net>
References: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY16-F138F014D31905BBA75CC46BA160@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I have a problem redirecting traffic from $SERVER:11000 to 
> 127.0.0.1:10001. The situation is that I need more than one 
> serverprocess listening to ONE specific port in this case port 11000. 
> Ofcourse this is  not possible, but there is only ONE client connection 
> at a time to ONE serverprocess. So instead that the process is listening 
> on $SERVER:11000, it is listening on 127.0.0.1:10001 and the second 
> serverprocess is listening on 127.0.0.1:10002 and so on. So I can 
> depending on the source IP address redirect traffic from $SERVER:11000 
> to 127.0.0.1:$FREEPORT. Let me give an example in pseudo firewall rules:

This is an interesting problem and might be a bit tricky to solve.

> I tried the following to achive this in iptables and failed:
> 
> iptables -t nat -A PREROUTING -p tcp -s $CLIENT_ONE -d $SERVER --dport 
> 11000 -j REDIRECT --to-ports 11001
> iptables -t nat -A PREROUTING -p tcp -s $CLIENT_TWO -d $SERVER --dport 
> 11000 -j REDIRECT --to-ports 11002
> iptables -t nat -A PREROUTING -p tcp -s $CLIENT_THREE -d $SERVER --dport 
> 11000 -j REDIRECT --to-ports 11003

...

> The problem is that the client and server cannot establish a connection. 
> Who can help me solve this porblem!!

Hmm, according to your earlier paragraph your processes were listening on port 10001, 10002, and 10003, not 11001 - 11003.  This could explain the failure that you had.

> Thanks in advance

No problem.

If you are interested in trying what I'm going to mention below you will need to patch your kernel and IPTables via the netfilter patch-o-matic and recompile both of them.

You are presently using a static one to one mapping of client IP to listening server process.  If you are wanting to pseudo round - robin redirect incoming connections to a listening process you could try something like the following:

iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 0 -j REDIRECT --to-ports 10001
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 1 -j REDIRECT --to-ports 10002
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 2 -j REDIRECT --to-ports 10003
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 3 -j REDIRECT --to-ports 10004

I would be tempted to clean things up a bit and have my different listening processes listening on 127.0.0.1:11000, :11001, :11002, :11003 so that your rules would look something like this:

iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 0 -j REDIRECT --to-ports 11000
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 1 -j REDIRECT --to-ports 11001
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 2 -j REDIRECT --to-ports 11002
iptables -t nat -A PREROUTING -d $SERVER -p tcp --dport 11000 -m state --state NEW -m nth --every 4 --packet 3 -j REDIRECT --to-ports 11003

Seeing as how I don't have any way to test the functionality of this all I can do to test it is to see if I can create such a table / chain structure on my firewall at the house.  I was able to successfully do this so I think you might be able to get it to work.  The idea behind this is to round robin redirect each NEW connection to a listening process (presuming that the process that it gets redirected to is not busy).  I can not test this but I think that the NAT code will only need to be processed on NEW connections.  (Does any one have any comments on this?)

This would allow the last digit of the listening port to be the same as the packet number in the nth match extension that would be matched.  IMHO this makes things a bit easier to read and less confusing down the road in such that there will be less ambiguity if you ever need to work on things.

I personally only wrote out the rules for 4 listening processes.  If you would like to have more than 4 listening processes all you would need to do is change the "--every 4" entry to read the number of listening processes that you do have and update the "--packet" entries accordingly for the new listening ports.

I know that I took your question and ran with it.  I originally read that this is the type of solution that you were wanting and only later after thinking about and rereading your question noticed the this was not the case but rather how to make the static one to one mapping work and subsequently saw the port mismatch.

> My OS is Fedora Core 3 (kernel 2.6.11) with iptables v1.2.11.
> Here are my iptable rules:

You will probably need to download recent kernel, iptables, and patch-o-matic sources and compile them to take advantage of the nth match to try what I have suggested as I'm doubting that FC3 has nth support in the kernel.



Grant. . . .

