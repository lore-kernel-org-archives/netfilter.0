From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: RE: fxp doesnt work & connection tracking
Date: Sat, 14 Sep 2002 13:58:48 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209141356520.20585-100000@server.piarista-kkt.sulinet.hu>
References: <FLEKIPPLAEDMJMOOBBDPGEKBCOAA.stewart.thompson@shaw.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FLEKIPPLAEDMJMOOBBDPGEKBCOAA.stewart.thompson@shaw.ca>
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
To: Stewart Thompson <stewart.thompson@shaw.ca>
Cc: netfilter@lists.netfilter.org

On Sat, 14 Sep 2002, Stewart Thompson wrote:

> Hi:
> 
> 	I don't see any rules to accept new connections. You are only
> allowing Established and Related connections. So another machine will
> never be able to start a connection.
i though fxp is RELATED type.. im trying to enable NEW too to 1024:
i'll write my results.

> I am not familiar with fxp. Is the
> connection to your firewall machine, or forwarded to an internal machine?
to my fw machine
there arent any lan or sg like that.

> The output might work because I don't see any rules here to prevent outgoing
> connections. You might have to post your whole rule set so we can see
> exactly what you are trying to do.
this is my whole ruleset :)

NagyZ



