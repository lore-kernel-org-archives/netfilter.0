From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Re: Fwd: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 13:18:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715201812.79935.qmail@web40708.mail.yahoo.com>
References: <200407152113.55450.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407152113.55450.Antony@Soft-Solutions.co.uk>
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

I allow myself restricted by IP to connect in for SSH
on the LAN interface on the fedora box.

However, no Input/Output is alowed on the WAN
interface though.

Sorry I guess I lied/misled by saying "NO"
input/output - as I was just referring to the WAN.




--- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> On Thursday 15 July 2004 8:55 pm, Real Cucumber
> wrote:
> 
> > I do have a state rule already for allowing any
> > established,related connections.
> 
> In that case you are already allowing ICMP :)
> 
> > So should I add another one such as:
> >
> > iptables -A FORWARD -p icmp -m state --state
> RELATED
> > -j ACCEPT
> 
> No.   ICMP messages which are RELATED to the
> existing SSH connections will get 
> matched by the final rule in this section of your
> rules:
> 
> # Allow previously initiated and accepted
> connections
> # to bypass firewall tests (state matching)
> iptables -A INPUT -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> Just out of interest, why do you have the first two
> of these rules, if you 
> have no INPUT or OUTPUT traffic?
> 
> Regards,
> 
> Antony.
> 
> -- 
> Microsoft may sell more software than any other
> company, but McDonald's sell 
> more burgers than any other company, and I think the
> other similarities are 
> obvious...
> 
>                                                     
> Please reply to the list;
>                                                     
>       please don't CC me.
> 
> 
> 



	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

