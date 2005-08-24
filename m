From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: Connections
Date: Wed, 24 Aug 2005 17:07:51 +0200
Message-ID: <430C8D47.4040701@imag.fr>
References: <001e01c5a8bb$c3b95160$0300a8c0@office>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001e01c5a8bb$c3b95160$0300a8c0@office>
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
To: Lyubomir Louisov <lyubol@mail.orbitel.bg>
Cc: netfilter@lists.netfilter.org

Lyubomir Louisov wrote:
> Hi.
> My torrent client is using too much connections at the same time and thats
> why i cant browse the net.
> My question is how can i limit the number of connections with iptables?
> 
> 

You'd better use a QOS solution, to reduce the priority of the torrent 
data compared to the other stuff data

