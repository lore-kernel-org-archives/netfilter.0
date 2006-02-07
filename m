From: ich hier <user01@kyberwelt.de>
Subject: Re: Unknown error 4294967295
Date: Tue, 7 Feb 2006 11:44:51 +0100
Message-ID: <20060207114451.68d6a6fa.user01@kyberwelt.de>
References: <1139275250.3600.3.camel@davila.nicaraguaopensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139275250.3600.3.camel@davila.nicaraguaopensource.com>
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

Hi

On Mon, 06 Feb 2006 19:20:49 -0600
Jorge Davila <davila@nicaraguaopensource.com> wrote:

> Hi list!:
> 
> Trying to execute this rule
> 
> iptables -t mangle -A PREROUTING -s  -j NETMAP --to 192.168.3.0/24
> 
> I receive
> 
> iptables: Unknown error 4294967295
> 
> Someone knows where to look?
> 

first i would look into your arguments, as the source-ip(range) to match
is not specified. second i would look into the argument-handling of
iptables as this error is easy to catch ;)

regards
virtual

