From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Ports
Date: Mon, 9 Sep 2002 13:41:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909174108.GS7289@cannon.eng.us.uu.net>
References: <3D7CDA9B.1070706@iol.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3D7CDA9B.1070706@iol.it>
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
To: Mattia Martinello <m.martinello@iol.it>
Cc: netfilter <netfilter@lists.netfilter.org>

On Mon, Sep 09, 2002 at 07:30:03PM +0200, Mattia Martinello wrote:

> Could I allow a packet to transit in the FORWARD chain (under 
> masquerading) from some host (or any host) to a host on a port?
> 
> iptables -A FORWARD -p tcp -s 0.0.0.0/0 -d 192.168.2.101 -dport 80 -j ACCEPT

I think that your problem is --dport. You missed a "-".

Ramin

> 
> don't work (only one -d is allowed). What can I do?
> 
> Thank you very much
> Bye
> Mattia
> 

