From: Philip Craig <philipc@snapgear.com>
Subject: Re: Unknown error 4294967295
Date: Tue, 07 Feb 2006 14:10:30 +1000
Message-ID: <43E81DB6.1040504@snapgear.com>
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
To: Jorge Davila <davila@nicaraguaopensource.com>
Cc: netfilter@lists.netfilter.org

On 02/07/2006 11:20 AM, Jorge Davila wrote:
> Trying to execute this rule
> 
> iptables -t mangle -A PREROUTING -s  -j NETMAP --to 192.168.3.0/24
> 
> I receive
> 
> iptables: Unknown error 4294967295

I assume you really had an address after the -s option.

I can't explain the error you are seeing, but at least one
problem is that you must use the nat table, not the mangle table.


