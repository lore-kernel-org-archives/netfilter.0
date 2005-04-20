From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: TTL Examples
Date: Wed, 20 Apr 2005 17:32:23 -0500
Message-ID: <4266D877.3030201@riverviewtech.net>
References: <060601c54572$90801ab0$09603fca@southern>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <060601c54572$90801ab0$09603fca@southern>
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
To: hareram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

> can some one give me the example script.

I don't think there is really a script per say that will do this.  As quite often such systems are monitoring traffic remembering what recent values were and looking for a difference in the norm as a sign of something funny going on.

> i would like to restrict other side use only one PC, he/she should not 
> use any proxy server or any other NAT.

Rather than doing something to prevent the client from using multiple systems behind some sort of NAT and / or proxy I've found it much easier (technically and on my concious) and reliable to just allow the client to have as may systems as they want and just bill based on bandwidth.  If the client decides that they want to do this then they can do so, they will just have to distribute the bandwidth costs.

If you really want to do this you could set something up that would limit the number of connections that any given IP could have initiated at one time.  However I think this could EASILY break a LOT of things.  If you REALLY want to put a system in place and have it try to guess if there are multiple clients behind a system you should probably look at the sequence numbers that are coming out in packets too as a single system should have sequence numbers that are incrementing higher, not necessarily in sequential as in 123, 124, 125, as in the current sequence number should be higher than the previous and the next sequence number should be larger than the current.  The sequence numbers should not jump all over the scale as this is another sign that there are multiple systems behind the firewall.  In fact quite often if you have enough sequence numbers you can even guess fairly close as to
  how many systems are behind the firewall.



Grant. . . .

