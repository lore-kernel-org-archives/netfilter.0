From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Netbios over NAT
Date: Thu, 19 Oct 2006 11:38:52 -0400
Message-ID: <1161272332.3212.12.camel@localhost>
References: <af07baa70610190728o14b82f89u40525a9e35340e6e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <af07baa70610190728o14b82f89u40525a9e35340e6e@mail.gmail.com>
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
To: Jeremy <jnhefner@gmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2006-10-19 at 10:28 -0400, Jeremy wrote:
> Has anyone been able to hack netfilter in order to get it to work with
> Netbios over NAT? I've been searching online and I read some posts
> from 2002 that said it didn't, but I was wondering if anyone has
> written anything for it recently to allow those types of connections?

As far as I know, most NetBIOS functionality works across NAT except for
browsing (and perhaps name registration). That seems to embed the IP
address in the upper layer data.

We had an interest in partially sponsoring this addition which is
apparently near trivial.  In the ISCS network security management
project, we have a feature to map one network to another address to help
resolve internal IP address conflicts.  It's not a perfect solution but
it helps in a pinch.  The failure of browsing working across the NAT is
one of its major shortcomings.

Patrick McHardy was interested in writing the helper but we never found
full sponsorship.  If I recall, it was only around an US$800 job.  I do
not believe anyone else has added this functionality.

It's one of the very few areas where I have found iptables falling short
of the major commercial firewalls many of whom have a NetBIOS NAT helper
- John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


