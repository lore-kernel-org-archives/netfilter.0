From: Ed W <lists@wildgooses.com>
Subject: Re: New/Updated L7 netfilter  option - nDPI
Date: Fri, 02 Nov 2012 13:40:21 +0000
Message-ID: <5093CD45.8090607@wildgooses.com>
References: <5088717B.6080300@wildgooses.com>
	<1351412418.2740.5.camel@andylaptop>
	<508D47E2.8020800@ngtech.co.il>
	<1351807382.2243.51.camel@andylaptop>
	<5092FE2D.40009@wildgooses.com> <5093BEAB.2040002@metu.edu.tr>
Reply-To: ntop-dev@unipi.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ntop-dev-bounces@listgateway.unipi.it>
In-Reply-To: <5093BEAB.2040002@metu.edu.tr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://listgateway.unipi.it/mailman/options/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=unsubscribe>
List-Archive: <http://listgateway.unipi.it/pipermail/ntop-dev>
List-Post: <mailto:ntop-dev@listgateway.unipi.it>
List-Help: <mailto:ntop-dev-request@listgateway.unipi.it?subject=help>
List-Subscribe: <http://listgateway.unipi.it/mailman/listinfo/ntop-dev>,
	<mailto:ntop-dev-request@listgateway.unipi.it?subject=subscribe>
Sender: ntop-dev-bounces@listgateway.unipi.it
Errors-To: ntop-dev-bounces@listgateway.unipi.it
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lutfi ODUNCUOGLU <lutfio@metu.edu.tr>
Cc: netfilter@vger.kernel.org, Eliezer Croitoru <eliezer@ngtech.co.il>, ntop-dev@unipi.it

On 02/11/2012 12:38, Lutfi ODUNCUOGLU wrote:
> Hello,
>
> I compiled nDPI-nefilter patch and it works fine. What I want is to 
> shape the p2p traffic in my network. For this purpose i just 
> implemented the nDPI-netfilter patch as two different ways for testing
>
>  iptables -t mangle -A POSTROUTING -o XXX -m ndpi --bittorrent -j 
> CONNMARK --set-mark 1
>
>
> iptables -t mangle -A POSTROUTING -m connmark --mark 1  -j CLASSIFY 
> --set-class 0001:0010
>
> or
>
> iptables -t mangle -A POSTROUTING -m ndpi --bittorrent  -j CLASSIFY 
> --set-class 0001:0010
>
>
> So which one is more suitable for use? I don't know if this patch 
> inspects connections (marks connection) or every single packet (marks 
> every single) for a match.

I would be interested in your feedback on CPU usage for both actually?

Internally nDPI implements a "connection cache", which means that it 
asks conntrack to maintain the connection, but internally it maintains a 
cache of what protocol is matched to a given connection.  This should be 
quite similar to asking conntrack to --set-mark *if* you also have some 
iptables to subsequently skip the test once the connection is marked?

So, either way, the connection gets marked at some point and thereafter 
no CPU is expended checking the connection further.  Of course theory 
and practice aren't the same...

Just beware that the connection may only get marked several packets in, 
ie the first few packets might not match anything, then the protocol 
will be detected, thereafter the protocol is wedged as being detected as 
that protocol.  This can obviously mean several packets potentially 
going out unmarked even if the connection is subsequently marked (not 
normally a problem)

Grateful for your benchmarks!

Ed W
