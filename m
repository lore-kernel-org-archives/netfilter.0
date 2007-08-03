From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Iptables rules processing
Date: Fri, 03 Aug 2007 14:29:37 -0500
Message-ID: <46B38221.2070108@riverviewtech.net>
References: <20070803170735.GC7815@sid.toystory.lan>	<001b01c7d5f4$91781110$0101000a@tanjian>
	<20070803174410.GA11029@sid.toystory.lan>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070803174410.GA11029@sid.toystory.lan>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/03/07 12:44, Franck Joncourt wrote:
> This is waht I wanted to know, I can't get such a processing without 
> the user defined chains ; Iptables doesn't do it by itself.

The IPTables rules you have posted do not do it, though I think you
could use a mport match to accomplish what you are wanting to do.  I.e.:

iptables -A INPUT -s 192.168.10.14 -p tcp -m mport --source-ports 80,443
-j ACCEPT



Grant. . . .

