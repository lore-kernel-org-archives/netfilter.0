From: Wolfgang Pichler <madmin@dialog-telekom.at>
Subject: RE: backroute problem
Date: 24 Jul 2003 08:24:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059035062.1937.2.camel@defiant.dialog>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BF94@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BF94@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

i am not an expert - but how can i use iproute2 routing by source ip ?
If i understand the whole thing right then the webserver doesn't get the
ip of the firewall as source ip - it gets the original ip - so - how can
iproute2 then know which packet was comming from the firewall and which
packet was comming from the old gateway.

But another thing come to mind: Wouldn't it be possible to Mark the
packets on the firewall - and then tell iproute2 to route marked packets
to the firewall back ?

mfG
Wolfi

Am Mit, 2003-07-23 um 21.58 schrieb George Vieira:
> You have to use iproute2 to route by source IP and not destination (default gateway).
> 
> There is an iptables patch in p-o-m which does some funky iproute stuff too but not sure the name.. have a look
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
> -----Original Message-----
> From: Wolfgang Pichler [mailto:madmin@dialog-telekom.at]
> Sent: Thursday, July 24, 2003 6:03 AM
> To: netfilter@lists.netfilter.org
> Subject: backroute problem
> 
> 
> hi all,
> 
> we have got new ip addresses - the old one's still exists so that i can
> migrate them to the new ones.
> 
> the old ip's are directly assigned to the web/mail server (i know that
> this isn't good - but i havn't had a fireall at this time) - now i have
> a seperate firewall which has the new ip's assigned to it.
> 
> Now i'd like to change the dns entries so that the traffic goes over the
> new ip's (a 4 MBit line ;-) ) - the problem i have is:
> 
> when a packet on the new ip comes then it gets prerouted by the firewall
> to the webserver - the webserver gets the packet with the original
> source address - now to webserver wants to answer to the packet - but
> becuase of the old ip's the webserver have a default route with the old
> ip and try's to route the packet over the old gateway - and not back to
> the firewall... You know - that can't work.
> 
> I am now searching for a solution for this problem. Can netfilter help
> me with this problem - or do i have to use iproute (i havn't ever done
> something with iproute) help me ?
> 
> Can i mark the packet's so the the webserver can send them back in the
> right direction ?
> 
> mfG
> Wolfi
> 
> 
> 
> 
> 
> 
> 
> 




