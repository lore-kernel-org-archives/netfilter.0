From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: dns question
Date: Thu, 18 Nov 2004 09:50:50 -0400
Message-ID: <005101c4cd75$9d193880$49caa8c0@caris.priv>
References: <000d01c4cd6a$a1b8b240$49caa8c0@caris.priv>
	<1100785489.3848.24.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter <netfilter@lists.netfilter.org>

No .. but I do have the following at the end of my named.conf file .... the
db.cache file has all of the root servers.   I just was not sure if it would
cause problems just removing that section as it was in all of the examples I
read.

zone "." {
       type hint;
       file "/etc/named/db.cache";
       };


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: "Peter Marshall" <peter.marshall@caris.com>
Cc: "netfilter" <netfilter@lists.netfilter.org>
Sent: Thursday, November 18, 2004 9:44 AM
Subject: Re: dns question


On Thu, 2004-11-18 at 07:32, Peter Marshall wrote:
> I am sure this is a stupid question ...but I will ask anyway.  Should I be
> allowing my dns server (in my dmz) connect to root servers ?   At the
moment
> it is being bloced, and the only thing it can connect to is my ISP's DNS
> server.  Basically, my dns server serves requests for servers in my dmz
for
> my internal users.  If it can't find the hit, it passs the request on to
my
> ISP's ... I am trying to clean up my firewall logs, and noticed that the
DNS
> server is always trying to query root servers.  I was just not sure if
this
> should be allowed.  If it is not, (and I suspect there is no need to) Is
> there a way to make my DNS server stop quering the root servers ?
>
> PS  DNS is a rh9 box running bind.

if your bind configuration specifies:

        forwarders {
                x.x.x.x;
                x.x.x.x;
                // 24.25.4.107;
                // 24.25.4.108;
                4.2.2.2;
                4.2.2.1;
                4.2.2.3;
        };
--
"My cat's breath smells like cat food."
--The Simpsons



