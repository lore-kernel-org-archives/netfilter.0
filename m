From: Jason Opperisano <opie@817west.com>
Subject: Re: blocking msn
Date: Thu, 23 Dec 2004 11:13:51 -0500
Message-ID: <1103818431.6478.83.camel@hubcap.ljm.dom>
References: <a0f69e50412230713fbf2ec4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e50412230713fbf2ec4@mail.gmail.com>
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

On Thu, 2004-12-23 at 10:13, Askar wrote:
> hey here is quick question let suppose i drop MSN with the below rule
> 
> #iptables -A FORWARD -p tcp --dport 1863 -j DROP
> 
> but its not enough, if 1863 is blocked it tries to use port 80.
> 
> any work around ?
> regards

the "proper" way to do this, is to block "--dport 1863" in your firewall
rules, and also REDIRECT port 80 traffic to a transparent HTTP proxy
(like squid), and use ACLs in the proxy to block access to:

  http://gateway.messenger.hotmail.com/gateway/gateway.dll

if you want to do this with just IP filtering, you could try blocking
port 80 access to 207.46.104.20, which is what that FQDN currently
resolves to--but this solution is kludgey and requires that you keep up
with the IP address(es) constantly.

-j

--
"I have been shot eight times this year, and as a result, I almost
 missed work."
	--The Simpsons


