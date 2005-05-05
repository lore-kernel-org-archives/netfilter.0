From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: forward packets directly to net?
Date: Thu, 5 May 2005 06:23:11 -0400
Message-ID: <200505050623.11868.Alistair@nerdnet.ca>
References: <200505051153.52443.chadley@pinteq.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505051153.52443.chadley@pinteq.co.za>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On May 5, 2005 05:53 am, Chadley Wilson wrote:
> Greetings friends
>
> I hope I explain this correctly, Please try and help me here, I am
> seriously stuck
>
> I have two interfaces on a linux router {int} {ext}
> I have two PCs on either side of the router {chad} on {int} and {xxx}on
> {ext}
>
> {xxx} is my gw to the net, but {chad} needs to be the only PC that can
> access the internet fron the {int} side.
>
> The problem I am faced with is how do I do it, Here is what I have got so
> far:
>
>
>
> pt="/usr/sbin/iptables"
> ext="eth0"
> int="bond0"
> chad="192.168.2.5"
> etel="196.25.100.28"
>
>
>
> #Enable IP Forwarding
> echo "1" >> /proc/sys/net/ipv4/ip_forward
>
>
> #Clear All Tables
> ${ipt} -t filter -F
> ${ipt} -t nat -F
>
>
> ## allow all from local interfaces [localhost]
> ${ipt} -t filter -A INPUT -s 127.0.0.1 -j ACCEPT
>
>
> ##Allow {chad} to etel internet direct
> ${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -d ${etel} -p tcp -m tcp
> --dport 80 --state NEW,ESTABLISHED,RELATED -j ACCEPT
> ${ipt} -t filter -A FORWARD -p tcp -m tcp -s ${chad} -d ${etel} -o ${ext}
> --dport 80 -j MASQUERADE
>

	Hmm. okay
	1)  You don't appear to be setting chain POLICY anywhere -- and likely they 
are all ACCEPT.  I suspect you want to set them to DROP, otherwise everyone 
can get out.
	2) You have these rules backwards as to which table they are in.  The 
MASQUERADE rule should be in POSTROUTING -t nat, the ESTABLISHED,RELATED rule 
should be in -t filter FORWARD.
	3) You then need one more rule to let initial connections OUT through -t 
filter FORWARD - This should filter by source IP and what dports you want to 
let out, then you can drop said filtering on the MASQUERADE rule.
	4) if you do set all POLICY to drop, you need to let loopback OUT as well.

>
> Please could someone help me with a simpler rule?

	I suspect it could be simpler, but it wouldn't nessesarily do what you want.
	
	
	Alistair Tonner

