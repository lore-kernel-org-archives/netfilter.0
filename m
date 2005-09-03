From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Sat, 03 Sep 2005 17:08:24 -0500
Message-ID: <431A1ED8.4090707@riverviewtech.net>
References: <42C0F7E4.4060805@riverviewtech.net>	<004801c57e70$1fad3890$4206a8c0@loki>
	<5d2f379105070210137e0af6ca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f379105070210137e0af6ca@mail.gmail.com>
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

> To protect against DoS, is there any easy way of requiring that three
> packets be transferred in an SSH connection before it triggers a
> recent update?  Since someone spoofing source IPs to DoS would be
> unlikely to continue the connection with the server, such DoS attacks
> might be foiled more effectively this way than using rttl (which the
> attacker can just exhaustively try all values for).

(I've not responded to these posts b/c I don't have the needed resources in my kernel (and I'm not running modules) and I have not had the time to recompile for my Cobalt (non standard kernel & boot process).)

I think it would be vary easy to use the connbytes module to test for the number of packets or the amount of data that has been transfered in any given connection.  In fact this is how I was going to determine on the packet level that an SSH connection was good and assume that the user had successfully logged in.  If any given connection has transfered x number of bytes or y number of packets then I'll assume (on the network layer) that they have successfully logged in on the application layer and that they are a valid user.



Grant. . . .

