From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: local forwarding(?)
Date: Fri, 17 Jan 2003 17:20:00 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0301171647240.1320-100000@abodh.pesit.deeproot.co.in>
References: <200301171115.h0HBFJZC013763@ns.kdtc.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301171115.h0HBFJZC013763@ns.kdtc.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cc <cc@ns.kdtc.net>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Fri, 17 Jan 2003, cc wrote:
> Hi,
>
> I finally got the bridge working and so far,
> things look ok.

Congrates ..

>
> From the outside, I can goto the website.  That's
> no problem.  The problem is for local machines
> going to http://www.mydomain.com/, the firewall
> doesn't seem to be redirecting it properly.
> LAN users have to use http://192.168.11.10/ to
> access the website instead of the www.mydomain.com.
>
> I understand that the actual ip address skips
> the firewall and goes directly to the machine.
> From my boss' point of view(totally ignorant
> that 192.168.11.10 = www.mydomain.com), he
> doesn't like that.  So I'm hoping that he
> can access (locally) www.mydomain.com.
>
> So far my firewall script (the lines pertaining
> to the www port) is as follows:
>
> $IPTABLES -t nat -A PREROUTING -p tcp -i eth0 x.x.x.x \
>       --dport 80 -j DNAT --to 192.168.10.11

There is no -d or -s option in the above command ....
Well, I guess that would be your public ip and the option would be -d in
that case.

Two things possible :-

	1> What IP address does the your dns resolve for www.mydomain.com
	   a)x.x.x.x
	   b)192.168.10.11

	try: $dig www.mydomain.com

	2> Check wheather eth0 is really your internal interface !! As you
	   have set up a bridge you can as well say the <bridge interface>
           <br0> .. But if you are really paranoid about the security then
	   try eth1 also.

	try: put separate rules for eth0 and eth1 and check which counter
		is incretmented... $iptables -nvL ....

> $IPTABLES -A FORWARD -p tcp -i eth0 -d 192.168.10.11 \
>       --dport 80 -j ACCEPT

Again, check the counters.

> $IPTABLES -A FORWARD -p tcp -i eth0 --dport 80 -j DROP
>
> (I'm not entirely sure about that last item.  It looks
> strangely invalid...but I could be wrong.  I don't
> even think I should have that there.. am I right?)

In my perseption, you dont want any other web site to be visited with this
rule.

>
> If all my LAN ips are of the 192.168.10.0 host,
> and the web server is 192.168.10.11, how do I
> get the LAN clients to go to www.mydomain.com and
> have the firewall redirect the packets to 192.168.10.11?
>
> As you probably can figure out, I'm a little confused.
>
> Any help appreciated

Let us know if it helps you.

Bye,
Narendra.

In the middle of difficulty..... lies Opportunity. (Albert Einstein)
--------------------------------------------------------------------
Narendra Prabhu. B             Free Software at its product-ive best.
DeepRoot Linux                             http://www.deeproot.co.in
                ---- Server Appliances ----
             ---- Linux Support and Services ----
-------------------------------------------------------------------



