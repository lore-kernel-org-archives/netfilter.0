From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Is this correct?
Date: Thu, 19 Jun 2003 18:06:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306191806.33601.Alistair@nerdnet.ca>
References: <1056056839.18406.21.camel@localhost>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1056056839.18406.21.camel@localhost>
Content-Disposition: inline
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
To: Shawn <core@enodev.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On June 19, 2003 05:07 pm, Shawn wrote:
> I have a, iptables statement I would just like someone to say if I have
> it right.
>
> Let's say I have a linux box with eth0=10.0.0.250 and
> eth1=192.168.0.250, and there's a host (192.168.0.1) connected to eth1.
> I want to route connections from hosts in 10.0.0.0/24 land to 10.0.0.1
> onto the linux box's eth0, and have them NATed to 192.168.0.1
>
> Will the following statement do that?
>
> iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
> 	--to 192.168.0.1

	Ummm .
             Where is 10.0.0.1? (since the network is /24)
	   If eth0's ip is 10.0.0.250 why would any packets for 10.0.0.1 end up 
there?  Unless there is an *external* routing reference that puts 10.0.0.1 
through 10.0.0.250 this cannot work.  If there is such a routing, the rule 
should work.
	

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

