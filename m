From: "Andrej Ricnik" <lemmetink@hotmail.com>
Subject: Re: using iptables for poor-man's load balancing?
Date: Tue, 18 Feb 2003 22:10:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F47Rr8N0QB2qIuSRhAs0001f1e8@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



>Just curious if the following rules would work to round-robin the 
>connections:
To my understanding it's not robin-go-round but distributing
new requests to the currently least used IP (the one with the
smallest number of active connections), which should pretty
much do what you want, anyway.


Cheers,
Tink

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCM/IT/O d-(++)@ a C+(+++)@ UL++>+++ P+>+++ L++ E+@ W+@ N+ o? K? w---@(+) 
O+++(+)@ M-@ V? PS+ PE- Y+ PGP++ t- 5- X- R-(*) tv-@ b+ DI++ D-- G++ !e* 
h--- r++ z?
------END GEEK CODE BLOCK------


_________________________________________________________________
Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


