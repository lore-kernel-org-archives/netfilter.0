From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Need help diagnosing iptables MASQ rule issues...
Date: Mon, 14 Jul 2003 11:23:11 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307141119220.10510-100000@localhost>
References: <3F0B49EF.7030306@sslnz.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F0B49EF.7030306@sslnz.com>
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
To: Jason Grindlay <jasong@sslnz.com>
Cc: netfilter@lists.netfilter.org

Hi Jason,

> FileMaker then thinks is connected/gets data back from the server (which 
> as far as I understand is actually a PC on a LAN (10.0.0.202) behind the 
>   router whose remote IP we connect to (port 5003 is forwarded by that 
> router to the FileMaker server)  I think this is the point where 
> comunication breaks down - I think FileMaker stops trying to connect to 
> the Internet IP of the server and tries to connect to it's private LAN 
> IP which since it is on a totally different network doesn't work and the 
> client sits there trying and trying to reach the server untill it hits a 
> timeout.
> 
> Am I reading the data right do you think? (I'd just like to confirm I'm 
> not jumping to conclusions)

That appears to be correct to me.

> What really puzzles me is why FileMaker suddenlly seems to jump to 
> trying to connect to 10.0.0.202 - as far as I understand NAT the fact 
> that the server is behind a firewall/nat gateway on the other end should 
> be transparent to the client - it should never know it's not talking to 
> the router itself. 

Not quite. Many protocols have IP addresses embedded in the application
data. Unless there is a specific NAT helper for the protocol, then such
addresses will not be translated. If FileMaker Pro uses such a protocol,
then I'm not sure how your other routers manage to get around this
problem, unless they have a NAT helper for FileMaker.

> p.s.  If the client is trying to connect to the private IP of a remote 
> server would it be possible to tell Linux to get those packets and 
> forward them (stripped to look like they are addressed correctlly) to 
> the remote router ip?  I was thinking giving the lan interface a second 
> IP of 10.0.0.202 and then forwarding port 5003 to the NET ip of the 
> filemaker router, would that work?

It might work, but a simpler solution might be to DNAT packets addressed 
to 10.0.0.202, redirecting them to the remote server's public IP address, 
which should then DNAT them to the FileMaker server.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


