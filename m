From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: set RELATED?
Date: Tue, 29 Jul 2003 10:00:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030729140034.GA19385@cannon.eng.us.uu.net>
References: <000801c3531c$9b1fad40$3eac18ac@geosxp>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c3531c$9b1fad40$3eac18ac@geosxp>
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
Content-Transfer-Encoding: 7bit
To: George <george@xorgate.com>
Cc: netfilter@lists.netfilter.org

On Fri, Jul 25, 2003 at 08:21:21PM -0600, George wrote:

> Is there currently a way for iptables to force another packet stream conntrack entry to be RELATED without having to look inside of the packet data?
> 
> For example:  If a 10.0.0.2 client behind an iptables firewall were to send an IMCP echo to 10.20.30.1, could a rule be set up so that after the firewall see this packet, all udp packets sent to dport=45678 would be DNATed to 10.0.0.2?
> 
> The designated RELATED stream would in general then be just like any other conntrack entry.
> 
> My guess is that this would require a generic force-related module.

Let me see if I understood you well. You want something like this:

if (the firewall sees this traffic) then
    apply that rule
fi

I don't think we have something like this but I think this is very
helpful. Specially if the IF-test could pass some parameters to the
THEN-body. You might want to take this to the devel mailing list.

Ramin

