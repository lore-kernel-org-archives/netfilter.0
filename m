From: Juan Hernandez <alucard@kanux.com>
Subject: Re: simple questions to finally understand netfilter
Date: 27 Nov 2003 12:14:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069949657.9126.55.camel@webmail.aeropostal.com.ve>
References: <1069947718.9126.39.camel@webmail.aeropostal.com.ve>
	 <1069949045.28653.85.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069949045.28653.85.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Lista de netfilter <netfilter@lists.netfilter.org>

Another question...

On Thu, 2003-11-27 at 12:04, Ralf Spenneberg wrote:
> Am Don, 2003-11-27 um 16.41 schrieb Juan Hernandez:
> 
> > 1) This rule tells netfilter to drop any packet forwarding I guess
> > iptables -P FORWARD DROP
> This is a default rule. All packets not accepted or dropped by other
> rules will be dropped by this one.

If this drops everything else, how come there's access to the webserver
in that same machine?? It's not that I dont want it, its just that im
curious on what does this rule drops exactly cause I can still access my
webserver 

Juan


