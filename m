From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: iptables and SPI
Date: Wed, 22 Oct 2003 21:50:00 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022135000.GH2578@propaganda.localdomain>
References: <Law10-F111cDjoYAPNX00000043@hotmail.com>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Law10-F111cDjoYAPNX00000043@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, Oct 22, 2003 at 01:26:59PM +0000, dimitri borjac spoke thusly:

>but actually i think i wasn't clear enough in my last mail : is it
>possible to use iptables in order to NAT different VPN established between
>different NATted hosts and 1 remote gateway (the same gateway for all of
>them) ? Such a NAT would be made by watching both addresses, ports and
>SPIs...

OK, understood the scenario. According to the man page, there is the
--espspi match. You'd need to hardcode the SPIs between the relevant IPsec
hosts. You might need to do some other bits and pieces also.

I cannot say for certain whether conntrack will handle this natively, you
might need to use one of the ROUTE matches also. This is a guess, I might
be talking out of my ass.

>In other words :  is it possible for iptables to go and check the SPI field 
>in the ESP Header of the IPsec packet in ESP tunnel mode ?

See above.

