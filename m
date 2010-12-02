From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ClusterIP network slowdown
Date: Thu, 02 Dec 2010 13:10:02 +0100
Message-ID: <4CF78C9A.80302@netfilter.org>
References: <1291107610.2488.46.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1291107610.2488.46.camel@nerino>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Codutti <michele.codutti@uniud.it>
Cc: netfilter@vger.kernel.org

On 30/11/10 10:00, Michele Codutti wrote:
> Hello, in these days i had fun with the ClusterIP target associated to a
> web server. All is good and bright with the exception of two issues:
> - the message "CLUSTERIP: no conntrack!"
> - a general slowdown of the other network services (like ssh) of the two
> nodes of the cluster.
> To solve all my problems i've inserted this iptables rule:
> iptables -I INPUT 1 -m state --state INVALID -j DROP
> This is a solution that isn't good enough because i manage the apache2
> and the clustered ip with heartbeat2.
> Example: if i standby a node (for maintenance) and resume it after a
> while this can be a problem because heartbeat put the clusterip rule on
> top of the others so the dropping rule above became the second one and
> then the workaround had no effect.
> Why the clusterip had such an heavy impact on the networking? Before the
> clusterip my cluster was active-standby and i've got no problems at all.
> Now that the load per node is halved i noticed more load than before.
> The strangest thing is that (with the top tool) this load seem not exist
> and the nodes are not loaded at all:
> load average: 0.50, 0.36, 0.37
> How can i fix this without the dropping rule above?
> There is a way to see how the networking is loaded?

A suggestion, better use the 'cluster' match.
