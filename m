From: Tommy W <tommy@svearike.sytes.net>
Subject: Redirect local OUTPUT attempt
Date: Fri, 28 Jan 2005 12:50:08 +0100
Message-ID: <200501281250.08563.tommy@svearike.sytes.net>
Reply-To: 189@telia.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a rather easy question , I hope !
I'm trying to make a local connection attempt (specific port) to be redirected 
to (local computer, different port)
When configuring my gateway (another case and another computer)
I can use
iptables -t nat -I PREROUTING -s $IP -d $IP2 -p tcp -m tcp --dport 3434 -j 
--to-destination $IP3:$PORT

that works perfectly, but it's not working now.. I guess it's because it's a 
local connection (!?) as opposed to nat ,as it is in the gateway 
configuration.
What am I missing ?

I want 192.168.0.8:25 to be redirected to localhost:2525 basically.. (but only 
locally)

