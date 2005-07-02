From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Is anyone else getting these.
Date: Sat, 02 Jul 2005 04:16:26 -0500
Message-ID: <42C65B6A.8010503@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

Gary W. Smith wrote:
> I have verified my IP's not to on relays.ordb.org.  I'm wondering if
 > they blacklisted netfilter.org?

Vishnu.netfilter.org is not listed in any public block lists TTBOMK.

> FW: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail server found 
> on relays.ordb.org
> 
> -----Original Message-----
> From: Systemadministrator [mailto:postmaster@echtzeit.com] 
> Sent: Friday, July 01, 2005 2:11 PM
> To: Gary W. Smith
> Subject: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail server found on relays.ordb.org
> 
> Your message
> 
>   To:      netfilter@lists.netfilter.org
>   Subject: [SPAM] - Crazy portmap request - Sending mail server found on
> relays.ordb.org
>   Sent:    Fri, 1 Jul 2005 00:56:12 +0200
> 
> did not reach the following recipient(s):
> 
> phergenhahn@echtzeit.de on Fri, 1 Jul 2005 23:11:28 +0200

I got one and looked at the headers. I thought perhaps their braindead 
Microsoft software was reading the Received: lines and finding 
something. If so I don't know what it is.

More likely, it simply has a faulty test for relays.ordb.org. In Unix 
terms, something like /bin/true is checking. It always returns a 
positive result.

$ host 62.96.59.178
178.59.96.62.in-addr.arpa domain name pointer 
h-62.96.59.178.host.de.colt.net.
$ host h-62.96.59.178.host.de.colt.net.
Host h-62.96.59.178.host.de.colt.net not found: 3(NXDOMAIN)

They don't even have proper rDNS set up. Not surprising. This one would 
be a good candidate for spam blacklisting, and in due time it will be 
listed in the more aggressive RBL's.
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

