From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipt_string, udp, dns problem...
Date: Sun, 22 Sep 2002 13:35:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020922123537.XZOG28842.mta06-svc.ntlworld.com@there>
References: <1292.24.200.104.128.1032687264.squirrel@www.funio.com> <3D8DB447.1040607@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8DB447.1040607@fugmann.dhs.org>
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

On Sunday 22 September 2002 1:15 pm, Anders Fugmann wrote:

> Mark Steele wrote:
> > Hi there,
> >
> > I have a quick question regarding the iptables string module.
> >
> > I'm currently under siege from a DOS attack which is aimed
> > at my name server. I believe the culprit is spoofing
> > his IP address, and sending DNS requests to various
> > recursive name servers for a domain which used to be
> > hosted in my servers. To block this, I am trying to use
> > a string match to drop the packets like so:
> >
> > /usr/sbin/iptables -I INPUT -j DROP -p udp -s 0.0.0.0/0 -m \
> > string --string "militaire.org" --dport 53
>
> Are you sure the communication is not TCP, and please drop the -s
> 0.0.0.0/0, its redundant.

The communication for DNS *could* be over TCP, but the tcpdump output Mark 
included in the initial posting showed that it was coming over UDP (ie a 
simple client query, not a DNS-to-DNS zone transfer request).

I agree about removing the -s 0.0.0.0/0 - things like this make rules much 
harder to read.

> But.... This is not the way to do it. Iptables should not be confused
> with an application level filter. It should only be used to filter out
> at the lower levels of the OSI model.

Agreed !!!!!   I sometimes wish the --string match had never been included in 
netfilter at all, because it misleads people into thinking that netfilter can 
be used as a content filter.   It isn't a content filter !!!

> I guess that you are not hosting a master or slave DNS for the domain in
> question.

Actually I assumed from the initial posting that he was.   That was the 
reason why the requests end up on his DNS server from the various recursive 
name servers which Mark is getting the packets from.

If he wasn't running an authoritative name server for the domain in question 
then he shouldn't be getting any external requests at all.

> Ths most usual setup for a DNS is to provide DNS services to
> anyone behind the firewall, and to be master or slave for only a few
> domains. Is seems like a configuration problem, if you are providing
> DNS service for the whole internet.

Maybe Mark could clarify which of these situation applies ?

> I have less experience with older version of Bind, so I cannot say
> if this will work, but I guess that not much has changed.

You might be surprised :-)   There have been some *big* changes in the 
structure of Bind configuration files, and backward compatibility is not a 
safe thing to assume :-)

> In general - I suggest all people having a firewall installed, to
> configure their machines in such a way that no firewall was nessesary
> (in IPtables terms - with no _filter_ rules applied). A Firewall is only
> an extra safeguard, which should not be used to hide misconfigured srvices.

That's good advice.   Don't rely on a firewall to cover up known security 
problems.   Fix the problems and then use the firewall to stop the script 
kiddies bothering with your network at all.

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

