From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: doing prerouting/postrouting/output logfile problems
Date: Mon, 21 Oct 2002 16:09:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210211509.g9LF9lL32079@vulcan.rissington.net>
References: <1035208680.14664.26.camel@sander.dmdint.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035208680.14664.26.camel@sander.dmdint.com>
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

On Monday 21 October 2002 2:57 pm, Sander Sneekes wrote:

> Hi,
>
> I got a firewall (redhat 7.2/iptables) with behind it a couple of
> servers running apache/mail etc.
>
> Now i have 36 public ip's and for the outside it seems like the
> server are running public ip's i do that as followed :

You have 36 public IPs ???   Seems like a very strange number - 32 I could 
understand, but 36 ?   Oh well....

> firewall
> eth0 = x.x.x.x (public ip)
> eth1 = 192.168.2.1 (internal ip)
>
> webserver
>
> eth0 = 192.168.2.2
>
>  ${IPTABLES} -t nat -A PREROUTING -p tcp -d x.x.x.x --dport 80 -j DNAT
> --to-destination 192.168.2.2

Looks good.   This will change the destination address of packets coming in 
to your public IP so they reach the internal privately-addressed server.

>  ${IPTABLES} -t nat -A POSTROUTING -p tcp -d 192.168.2.2 --dport 80 -j
> SNAT --to-source 192.168.2.1

Why are you doing this ?   This will destroy the source address on packets 
going to your internal server so everything looks like its coming from the 
Firewall.   Most strange.


>  ${IPTABLES} -t nat -A OUTPUT -p tcp -d x.x.x.x --dport 80 -j DNAT
> --to-destination 192.168.2.2

You do realise that the OUTPUT chain is only for packets originating on the 
Firewall itself ?   This rule will change the destination address of any 
packets created on the Firewall, going to the public IP, so that they go to 
the private IP instead.   Why not just send them to the private IP in the 
first place ?   This rule has nothing to do with packets being forwarded 
through the Firewall.

> This work perfect people from the outside using x.x.x.x are getting a
> nice website. And also people inside the network using x.x.x.x also
> getting a nice site.

Ah.   That explains then why you are having to do the SNAT....

> But now here is my problem because in the logfile's of the site I get
> all entry's coming from 192.168.2.1 instead off when a client viset
> our site their ip. How can i solve it.?

If you remove the SNAT rule from the POSTROUTING chain you will get correct 
entries in your webserver logfile.   However this will then break your 
internal clients being able to access the public IP of the webserver (because 
the reply will come back from the private IP and the client will not be 
happy).

I suggest you modify the SNAT rule so that it only applies to packets from 
your local network:

${IPTABLES} -t nat -A POSTROUTING -p tcp -s 192.168.2.0/24 -d 192.168.2.2 
--dport 80 -j SNAT --to-source 192.168.2.1

The you will see correct public IPs in your webserver logifle for extenal 
visitors, and 192.168.2.1 for all internal accesses - presumably you'd be 
happy with this ?

> I also use these lines for do mail traffic and I had some problems with
> open Relaying.

Open Relaying is (a) a very bad thing to do, (b) nothing to do with netfilter 
rules, and (c) quite likely to get your mail server blocked by various 
anti-spam databases.   I suggest you correct your mail server configuration 
file so that it is not an open relay.

> Also because 192.168.2.1 was allowed to mail.

Not sure what you mean by this, but I expect once you've sorted out the Open 
Relay problem this will go away too.

Antony.

-- 

Perfection in design is achieved not when there is nothing left to add,
but rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

