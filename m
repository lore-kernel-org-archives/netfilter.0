From: Eric Joe <sysop@ns2.tje1.com>
Subject: Re: Redirection - considerations
Date: Thu, 10 Apr 2003 13:47:51 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304101345350.15216-100000@ns2.tje1.com>
References: <200304091305.45463.christian@cernuschi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304091305.45463.christian@cernuschi.com>
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
To: Christian Cernuschi <christian@cernuschi.com>
Cc: netfilter@lists.netfilter.org

On Wed, 9 Apr 2003, Christian Cernuschi wrote:

> it think it's impossible! (keeping the source address... of course)
> 
> an example
> 
> A - Client starting connection
> B - Server reached by A
> C - Destination Server
> 
> 
> 
> A calls B
> B sends packets to C with source address A
> C tries to respond to A!!! 
> A doesn't know C (then drops packet)
> 
> am i right?
> 

Didnt you already ask this question and got several answers from several 
people? It is *NOT* immpossible. See for yourself

http://www.tje1.com


The site you will arrive at is forwarded from the real www server


Eric




