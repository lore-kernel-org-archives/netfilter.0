From: "Andreas Grabner" <andi@vnc.at>
Subject: Re: NATTING for a whole network.
Date: Fri, 10 Dec 2004 19:58:01 +0100 (CET)
Message-ID: <40809.213.33.127.134.1102705081.squirrel@webmail.vnc.at>
References: <4D7EBAB4CCB6DB4AB7EE598E9ED186950474D69B@asusfl45cex08.us-fl.cards.citicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4D7EBAB4CCB6DB4AB7EE598E9ED186950474D69B@asusfl45cex08.us-fl.cards.citicorp.com>
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

Hi,
> I'm kinda new at this iptables thing.  I've been running into a problem
> with trying to NAT for a class C subnetted class A network...i.e.
> 10.168.1.0/24. The syntax I've been using is as follows -- $ipt -t nat
> -A POSTROUTING -o $outside -j SNAT -to-source $lan, with the variable
> $lan = "10.168.1.0/24". Everytime I've ran the script I get the
> following error <iptables v.x.x.x Bad IP Address.  Can anyone please
> help me with the proper syntax to make this work?  I've tried various
> options such the one above, also including the whole subnetmask  and
> playing around with different delimitation options, nothing seems to
> work.

I think you have to give the IP Address of the $outside Interface to
--to-source (not a network Address)
Are you trying to reach the Internet  from your local net?? then the
follwing should work:$ipt -t nat -A POSTROUTING -o $outside -j SNAT -to-source $outsideIP

If you dont have a static IP use -j MASQ

hth
Andreas Grabner



