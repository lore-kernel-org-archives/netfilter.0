From: Rommy Taslim <rommyt@transportservices.com.au>
Subject: RE: Forward UDP broadcast
Date: 03 Jun 2003 16:08:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054620503.23000.39.camel@hyperno.canodesc.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D96@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D96@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

Thanks for that.
One more question, does multicast route ? Or it'll be the same as
broadcast ?

Thanks again !

Rommy

On Tue, 2003-06-03 at 15:49, George Vieira wrote:
> Umm.. broadcasts don't route which is probably why it doesn't work. Your basically trying to use iptables as a bridging mechanism where you really need a bridge.
> 
> If the rule didn't work and there is no p-o-m to do something funky like this then I think your out of luck.. but I might be wrong..
> 
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
> 
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>  
> 
> -----Original Message-----
> From: Rommy Taslim [mailto:rommyt@transportservices.com.au]
> Sent: Tuesday, June 03, 2003 3:29 PM
> To: netfilter@lists.netfilter.org
> Subject: Forward UDP broadcast
> 
> 
> Hi,
> 
> Anyone knows how to forward UDP broadcast using iptables ?
> I need to do something like ipportfw does:
> ipportfw -A -u 192.168.4.255/699 -R 192.168.2.255/699
> 
> which forward all the broadcast on network 4 for port 699 to network 2.
> 
> I have something like this for iptables:
> 
> iptables -t nat -A PREROUTING -p udp \
>         -d 192.168.4.255 --dport 699 \
>         --to-destination 192.168.2.255:699
> 
> But it didn't work.
> 
> Anyone can give me some pointers ??
> 
> Thanks in advance.
> 
> Rommy
> 

