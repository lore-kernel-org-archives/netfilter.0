From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: ipt_string, udp, dns problem...
Date: Sun, 22 Sep 2002 14:15:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8DB447.1040607@fugmann.dhs.org>
References: <1292.24.200.104.128.1032687264.squirrel@www.funio.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: msteele@inet-technologies.com
Cc: netfilter@lists.netfilter.org

Mark Steele wrote:
> Hi there,
> 
> I have a quick question regarding the iptables string module.
> 
> I'm currently under siege from a DOS attack which is aimed
> at my name server. I believe the culprit is spoofing
> his IP address, and sending DNS requests to various
> recursive name servers for a domain which used to be
> hosted in my servers. To block this, I am trying to use
> a string match to drop the packets like so:
> 
> /usr/sbin/iptables -I INPUT -j DROP -p udp -s 0.0.0.0/0 -m \
> string --string "militaire.org" --dport 53
> 
Are you sure the communication is not TCP, and please drop the -s 
0.0.0.0/0, its redundant.

But.... This is not the way to do it. Iptables should not be confused 
with an application level filter. It should only be used to filter out 
at the lower levels of the OSI model.

I think that there is a nuch more generic way to stop this.
I guess that you are not hosting a master or slave DNS for the domain in 
question. Ths most usual setup for a DNS is to provide DNS services to 
anyone behind the firewall, and to be master or slave for only a few 
domains. Is seems like a configuration problem, if you are provinding 
DNS service for the whole internet.

Therefore you should configure your nameserver to allow queries from all 
clients behind the firewall, and only to service requests on the domains 
you are servicing from the internet.

In Bind9 the configuration would look something like this:

/* Bind9 configuration sample begins */

//ACL for machines that use the DNS as their primary.
acl "local" {
         { 10.0.0.0/23; 127.0.0.1; 80.xx.xx.98; };
};

//ACL for machines allowed yo do a zone transfer.
acl "backups" {
         { 80.xx.xx.54; 212.xx.xx.121;  };
};

options {
         allow-query    { "local"; };
         allow-transfer { "local"; };
};

// prime the server with knowledge of the root servers
zone "." {
         type hint;
         file "/etc/bind/db.root";
};

//Public zone.
zone "test.edu" {
         type master;
         file "/etc/bind/db.test.edu";
	//Allow anyone to query on this domain.
         allow-query { any; };
         allow-transfer { "backups"; };

};
/* Bind9 configuration sample ends */

Of course this is not a complete configuration, but I guess you get the 
idea. I have less experience with older version of Bind, so I cannot say 
if this will work, but I guess that not much has changed.

In general - I suggest all people having a firewall installed, to 
configure their machines in such a way that no firewall was nessesary 
(in IPtables terms - with no _filter_ rules applied). A Firewall is only 
an extra safeguard, which should not be used to hide misconfigured srvices.

Regards
Anders Fugmann




