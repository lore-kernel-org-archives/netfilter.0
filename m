From: zrm <zrm@trustiosity.com>
Subject: Re: Question on redirection & circumvention reporting
Date: Mon, 22 May 2017 20:42:47 -0400
Message-ID: <e48ee933-930f-3700-5cce-c03a80432efe@trustiosity.com>
References: <06a76100-227d-f5eb-535d-ef5051946bee@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1495500163; bh=3e42VWkdr1cxmd2lGxaVWyzop6JsiwzoxVATXlRrCJU=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=1vjO2yBZOUwH0xfNM6R5V3pYgExtMOkGaFwZvyzwISHFY/TunTiqejNK0QS6IOSED
         rn3n/4kVtiWermOunkSsE3MBN/xTcV5RAQUtBGnR8r74L26nmbrIjA372XEEYctD4x
         m4AkBkNLiyw3xqsVIKuMqA8M423KHgNT+AA9T3nU=
In-Reply-To: <06a76100-227d-f5eb-535d-ef5051946bee@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Delrue <delrue.thomas@gmail.com>, netfilter@vger.kernel.org

If the DNS server you want to use is on the same machine as the iptables 
router then what you are looking for is the REDIRECT target. If it is on 
a different machine you might be able to kludge something together using 
the DNAT and SNAT targets in the same nature as hairpin port mappings, 
but it is important to understand that what you are trying to do is not 
going to be effective against adversarial users.

Even if you redirect port 53, a user with control over their own machine 
can still set up an external DNS server on a different port and use 
that, or access one via a VPN or TLS tunnel or cellular data network, or 
add entries for anything to their hosts file, or use an external proxy 
or Tor or a hundred other things.

DNS-based filtering is quite hopeless.

On 05/22/2017 03:45 PM, Thomas Delrue wrote:
> Hello,
>
> I have an internal network with a couple tens-to-hundred devices on it.
> For internal reasons, everyone on the network should be using a specific
> set of DNS servers; for giggles, let's assume that the IP of those DNS
> servers are 10.0.0.2 & 10.0.0.3.
> On router for this network, we've set it so that it will use that
> particular DNS server to resolve domains and by default we use DHCP to
> tell all clients to use their gateway when resolving DNS queries, thus
> using 10.0.0.2 or 10.0.0.3.
>
> However, I'm sure you feel where I'm going because there's always that
> one guy/gal who's a tad bit too clever for their own good:
> We've run some traces and figured out that some of the folks (these are
> people who are tech-savy, don't have access to the router but do have
> admin/root-powers on their own machines) have been setting their own
> machines to use a non-sanctioned DNS server (e.g. 8.8.8.8 for you
> google-people out there).
>
> My question is twofold:
>
> First: Is there a way, using iptables (or some other firewall), to
> intercept DNS requests to anything but 10.0.0.2 and 10.0.0.3 and
> redirect them to 10.0.0.2 or 10.0.0.3 in such a way that said users
> would /think/ they get a response from 8.8.8.8 (i.e. they fire off their
> request to 8.8.8.8) but they actually get a response from 10.0.0.2 or
> 10.0.0.3.
>
> Second: If I wanted to figure out, on an ongoing basis (i.e. for future
> attempts), how many of these things are happening, when they are
> happening and who is using the non-sanctioned DNS server, so how would I
> generate a log of this? I would want genuine requests (to 10.0.0.2 or
> 10.0.0.3) to /not/ show up in the log and non-genuine requests (to port
> 53 on /anything but/ either 10.0.0.2 or 10.0.0.3) to show up with
> time-stamp and source IP.
> What would this look like?
>
> I was thinking about this and came up with something like this for
> iptables but don't know if it would work, so before I deploy/test this,
> I was wondering if there is anyone who would be able to tell me whether
> this would/could work or if this is a dumb thing to do...
>
> iptables -N DNS_MANDATE
> # these two DNS servers are mandated
> iptables -A DNS_MANDATE -d 10.0.0.2 --dport 53 -j ALLOW
> iptables -A DNS_MANDATE -d 10.0.0.3 --dport 53 -j ALLOW
> # log anything that hasn't returned
> iptables -A DNS_MANDATE -j LOG --log-prefix "DNS Circumvention Attempt:"
> # rewrite and redirect
> ##### [ ??? what goes here to do the actual redirect ??? ] #####
> # We're done after the redirect, but let the redirect through
> iptables -A DNS_MANDATE -j RETURN # Is this the right thing to do?
>
> # put this in the output chain?
> iptables -A OUTPUT -p tcp --dport 53 -j DNS_MANDATE
> iptables -A OUTPUT -p udp --dport 53 -j DNS_MANDATE
>
> For extra credit: how would I do this using ip6tables (for servers with
> IPv6 addresses assigned)? Would it be massively different? What about
> netfilter/nftables?
>
> Thanks
>
