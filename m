From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dynamic change of iptables (building Wi-Fi hotspot)
Date: Sun, 4 Jul 2004 18:03:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041803.40828.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
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

On Sunday 04 July 2004 5:33 pm, Vladimir Mosgalin wrote:

> I want to build a Wi-Fi hotspot. The linux box with wireless AP
> connected to it which provides internet access to people with Wi-Fi
> cards.
>
> When people pay for time or traffic some unique username and password is
> given to each. When they try to access any http website, for the first
> time each of them gets a login message. After entering name & password,
> they continue to work normally.
>
> I see two ways of doing it.
> 1) Iptables get changed by some script each time when someone registers
> or his time runs out. There is a rule
> iptables -A FORWARD -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:80

DNAT rules belong in the PREROUTING chain, nat table, not the FORWARD chain, 
filter table :)

Also, instead of -j DNAT --to 127.0.0.1, I think you should use -j REDIRECT.

> Thus, everyone gets forwarded to localhost.
> On localhost, apache has 404 error handler which redirects each to login
> page. When they sucessfully enter username and password, script adds
> line like this
> iptables -I FORWARD 1 -s $ip -j ACCEPT
> and now client can do whatever he wants.
>
> When unregistering, another script removes this line.
>
> I see two problems in this approach - I'm not sure whether changing
> iptables constantly is good, and I feel a bit anxious about the fact
> that several different scripts are running and doing something.
>
> Maybe there are other solutions (like very clever netfilter module which
> can be controlled from userspace)? Or there is nothing bad in changing
> iptables often?

I see no reason not to change netfilter rules as often as you like.   After 
all, adding one rule when a user registers, and removing one rule when they 
unregister or time out, is unlikely to be a large quantity of changes.

As for whether the several scripts are a problem - that depends on how good 
the scripts are :)   I don't see that they need to be at all complicated - 
the interesting part is going to be looking up the username / password (PHP / 
MySQL would seem an obvious candidate for this?), and then checking at 
regular intervals to see whether the time has been exceeded and the user need 
disconnecting.

Note, by the way, that if a user has an established connection, then neither 
changing the DNAT rule/s, nor removing their FORWARD rule from netfilter will 
result in their connection being terminated - you will need to explicitly add 
a DROP rule either at the top of the FORWARD chain (before the -m state 
--state ESTABLISHED,RELATED rule), or else in one of the mangle tables, in 
order to make sure the connection gets cut off.

The other thing I would say is that because you are talking about doing this 
over a wireless link, I think you *really* should use HTTPS, not HTTP, 
otherwise someone else in the vicinity will simply sniff the traffic, find 
out a valid username & password, and use it themselves.

I recommend the Apache 404 error handler redirects to an https: login page and 
you accept the username & password there.

Hope this helps,

Regards,

Antony.

-- 
The lottery is a tax for people who can't do maths.

                                                     Please reply to the list;
                                                           please don't CC me.


