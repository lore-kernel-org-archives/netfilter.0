From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: HAlinux,ipsec and proxies..
Date: Thu, 7 Aug 2003 11:07:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030807150747.GA24623@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C076@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C076@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

On Thu, Aug 07, 2003 at 04:48:03PM +1000, George Vieira wrote:

> I have 2 firewalls which are soon to be running HAlinux. Both external interfaces are eth1 on both machines and running a 10.10.10.1 and 10.10.10.2 for each firewall for HAlinux.
> When HAlinux starts up, the scripts add the external IP to the main firewall (FWa) using iproute2 so eth1 will always be the external device/IP...
>  
>         HA-Linux
>   v-- aa.bb.cc.dd --v
> 10.10.10.1   10.10.10.2
> ----------   ----------
> |  FWa   |   |   FWb  |
> ----------   ----------
>  
>  
> The 2 firewalls use the same config files/firewall scripts..etc.etc..so for the iptables script to work, firewallb looks at eth1 using a script and gets the last IP added to the interface as we don't want it to firewall based on the 10.10.10.X addresses assigned for HAlinux...
>  
> The script below grabs the correct IP of aa.bb.cc.dd from firewalla and firewallb (when fallover occurs). And all rules work with the "-d $EXTIP" being used..
>  
> getipfromdevice()
> {
>         DEV="$1"
>         DEVIP=`ip addr show dev $DEV | grep "inet" |tail -1 |awk {'print $2'} | cut -f1 -d "/"`
>         echo "$DEVIP"
> }
> EXTDEV=eth1
> EXTIP=getipfromdevice $EXTDEV
>  
> Now my main problem..
>  
> IPSEC has to be told which interface to use for the VPN.
> I use "interface=eth1" and it grabs 10.10.10.X which isn't correct and you can't tell ipsec to use another IP on the interface(AFAIK).
> I found ipsec works with "interface=eth1:1" but then the firewall scripts are a muck.. I prefer not to use aliasing if possible...
>  
> any other ideas or best solution??

Can you not have the 10. addresses be on another logical interface (like a vlan)
and the public ext IP on eth1 itself? That way your IP on eth1 does not
interfere with the HA IP on, say, vlan20.

Ramin

>  
> Thanks,
>  
> George Vieira.

