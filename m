From: Esteban <eribicic@sinectis.com>
Subject: Re: ip range generic matches
Date: 26 Feb 2003 05:27:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046248036.8624.2.camel@debian>
References: <7dfe27f780.7f7807dfe2@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7dfe27f780.7f7807dfe2@student.uml.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: William Olbrys <william_olbrys@student.uml.edu>
Cc: netfilter@lists.netfilter.org

you should try subnetting. like 10.0.0.0/29 or stuff.
greets.


On Wed, 2003-02-26 at 03:23, William Olbrys wrote:
> is there a syntax to to create a generic match for a range of ips
> instead of the whole thing? 
> 
> ex.: $IPTABLES -t filter -A FORWARD -s 10.1.2.0-10.1.5.255 -j ACCEPT
> 
> i tried to do this and it gave me an error about not being able to find
> the host. is there a workaround?
> 
> will olbrys
> 
> 
> 
>  E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.
> 
> 
> 
> 



