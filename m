From: "Martin McKeay" <mmckeay@stillsecure.com>
Subject: RE: ..prevention, was: syn DDoS attack solution
Date: Tue, 12 Jun 2007 12:10:03 -0600
Message-ID: <5C9E8CCEEB81ED498AC0C3B0054704F302A83EDE@webmail.latis.com>
References: <5C9E8CCEEB81ED498AC0C3B0054704F302A2379F@webmail.latis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <5C9E8CCEEB81ED498AC0C3B0054704F302A2379F@webmail.latis.com>
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

As promised, I wrote a blog entry on the blocking the bogon IP's and
included the full set of Iptables rules.
http://cobia.typepad.com/cobia_community_blog/how_to_use_cobia/index.htm
l

Thanks,

Martin   =20


Martin McKeay, CISSP, GSNA
Cobia Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://www.cobiablog.com

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Martin
McKeay
Sent: Thursday, June 07, 2007 12:42 PM
To: netfilter@lists.netfilter.org
Subject: RE: ..prevention, was: syn DDoS attack solution

I writing a blog post about the rules for blocking the bogon IP's
(unused IP networks) using the firewall module of our Cobia,  I was
considering including the equivalent iptables rules.  Would this be of
interest to anyone?


Martin McKeay, CISSP, GSNA
Cobia Product Evangelist
StillSecure
martin@stillsecure.com
707-495-7926
http://www.cobiablog.com

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Steven M
Campbell
Sent: Tuesday, June 05, 2007 9:41 AM
To: Arnt Karlsen
Cc: netfilter@lists.netfilter.org
Subject: Re: ..prevention, was: syn DDoS attack solution

Arnt Karlsen wrote:
> On Tue, 05 Jun 2007 10:16:40 -0400, Steven wrote in message
> <46657048.4040600@SCampbell.net>:
>
>  =20
>> And, most important for folks here, do egress filtering on your=20
>> firewall!    Help prevent zombie machines on your own networks from=20
>> being a problem, you can't stop your end users from bringing=20
>> infections into your network but you can control their spread.
>>    =20
>
> ..what tricks _are_ out there?  Set up some kinda p0f deamon and cut=20
> 'n tarpit any and all Wintendo network traffic attempts?
> Or even feed them LROS thru ActiveX if they need firm hints?
>
>  =20

Not really very tricky, limit outbound traffic to what is needed.   Do=20
all of your workstations need UDP ports outbound?  Smtp?    For a lot of

sites the average workstations internet requirements are very small,
especially if proxys are used for SMTP,HTTP,FTP, etc.  Just by blocking
most of the end users from direct internet access (or at least to a
small set of outbound protocol/ports) we render those machines pretty
useless to the bad guys.=20

It does, however, become very tricky if it's not done up front.  It's
really really tough to figure out what the requirements are if anyone=20
could historically do anything they wanted.    It's far better to=20
seriously restrict things up front and put in the exceptions as you find

them.   Sites that have historically allowed all outbound traffic are a=20
two fold problem, it's hard to fix and they are exactly the sorts of
sites the bad guys like to use.




