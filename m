From: "Julius Wijaya" <wijayaj@gmx.net>
Subject: Re: Filtering Yahoo Messenger Port
Date: Mon, 05 May 2003 09:01:56 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305050901560778.000A7D6C@smtp.nikonbw.com>
References: <006e01c3129f$79061e50$6400a8c0@homes>
Reply-To: wijayaj@gmx.net
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006e01c3129f$79061e50$6400a8c0@homes>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Voltaire Pascual <voltaire@voltaire.servebeer.com>, netfilter@lists.netfilter.org

just block all the connection to yahoo msg server:

scs-fooa.yahoo.com
scs-foob.yahoo.com
scs-fooc.yahoo.com
scs-food.yahoo.com
scs-fooe.yahoo.com
scs-foof.yahoo.com

that is the list I got so far,  I am rejecting the connection to those
servers after my DNS chain rules so when we put the servers name instead of
ip address, it can resolve all the ip address to that server.

if you just want to block certain range of ip from the LAN, check the lates
patch-o-matic for iptables.

http://www.netfilter.org/

regards.
JW

*********** REPLY SEPARATOR  ***********

On 05/05/2003 at 8:44 AM Voltaire Pascual wrote:

>Hi there... got one newbie question here. Just wondering how can i block
>yahoo messenger port using IP tables in my box. Clients using YM is behind
>this box.  YM is using all possible ports even port 80.
>
>TIA
>/Voltaire




