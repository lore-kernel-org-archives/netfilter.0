From: Eric Joe <sysop@ns2.tje1.com>
Subject: Re: redirection
Date: Thu, 10 Apr 2003 13:45:20 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304101343180.15216-100000@ns2.tje1.com>
References: <200304081810.57248.christian@cernuschi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304081810.57248.christian@cernuschi.com>
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

On Tue, 8 Apr 2003, Christian Cernuschi wrote:

> i'd like to do this:
> 
> i have 2 pc  
> x.y.z.1
> x.y.z.2
> 
> i would like to redirect connection on port 80 of x.y.z.1 to port 80 of 
> x.y.z.2
> 
> i tried with DNAT but when someone tries to connect it goes in timeout?
> 



iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -d x.y.z.1 -j 
DNAT --to x.y.z.2:80

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to x.y.z.1



We are doing the *exact* thing you want to do everyday with the above 2 
lines. 


Eric



