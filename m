From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: HELP! Transparent Proxy using bridging 2.6.9 and REDIRECT on
 different subnet
Date: Thu, 24 Mar 2005 02:50:12 -0600
Message-ID: <42427F44.8080608@riverviewtech.net>
References: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <2F413D5F33545D4A8465BBEE900238CC3FA777@cymmail.cymphonix.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Trevor Paskett <tpaskett@cymphonix.com>
Cc: coreteam@netfilter.org, netfilter@lists.netfilter.org

Bad news.  I'm unable to get my system here at the house to intercept traffic destined to port 22 (I chose SSH to work / test with as I don't have Squid installed on any there here at the house) and redirect it to it's self and successfully return the traffic back to my test workstation.  What I was testing was a bit different than what you are asking for help on but it should still serve as a proof of concept.  I was attempting to redirect traffic that was passing through my test firewall destined to port 22 to the local host port 22.  Below are the rules that I tested with:

iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination 127.0.0.1:22
iptables -t nat -A POSTROUTING -p tcp --dport 22 -j SNAT --to-source 127.0.0.1

If I just use something like the following:

iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT

I can get connected but my connections do not show up from where I would expect them to show up from, namely the firewall it's self.

Where as if I use the following rules, a slight modification of the first set just pointing to a different box, things work fine:

iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination 172.30.254.11:22
iptables -t nat -A POSTROUTING -p tcp --dport 22 -j SNAT --to-source 172.30.254.253

Ultimately I have a feeling the problem has to do with the packets traversal of the kernel / TCP/IP stack and where we can interface / interfere with it.  That being said some extremely dastardly things are probably going to need to be done to make things work the way that you want.  Thus are you willing to do some nasty things as running Squid in a UML, or what about just a UML router that does nothing other than rout the packets between a couple of interfaces thus allowing you to send traffic to a different system while still being in the same box?  If that was the case I think my solution where things were DNATed/SNATed to send the traffic to a foreign system and then ultimately rerouted the long way around would work, but it will be extremely nasty.  It will probably work, but I don't know if you will like it.  Unfortunately you are trying to do something that is EXTREMELY NOT normal
  and thus are left with extremely not normal solutions.



Grant. . . .

