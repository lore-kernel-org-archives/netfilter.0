From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack -E -i not allowed?
Date: Wed, 08 Nov 2006 20:29:47 +0100
Message-ID: <4552302B.1030509@netfilter.org>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611021111.19134.alan.ezust@presinet.com>
	<45507ED0.4000709@netfilter.org>
	<200611071037.52450.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200611071037.52450.alan.ezust@presinet.com>
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
To: Alan Ezust <alan.ezust@presinet.com>
Cc: netfilter@lists.netfilter.org

Alan Ezust wrote:
> We need to be able to determine when we get an UPDATE or a DISCONNECT, which 
> connections they correspond to. I assumed that was the purpose of the CT id.

The purpose was to uniquely identify a connection but we currenlty 
assume that the tuple {src, portsrc, dst, portdst, l3protonum, protonum} 
is enough.

> Why are you removing it? 

http://lists.netfilter.org/pipermail/netfilter-devel/2005-June/019923.html

-- 
The dawn of the fourth age of Linux firewalling is coming; a time of 
great struggle and heroic deeds -- J.Kadlecsik got inspired by J.Morris

