From: Jason Opperisano <opie@817west.com>
Subject: Re: Upper limit of users for iptables firewall
Date: Thu, 14 Oct 2004 08:10:04 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097755804.1708.14.camel@wolfpack.ljm.dom>
References: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041014074601.27218.qmail@web60406.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-10-14 at 03:46, ads nat wrote:
> Hi,
> My Redhat linux 9.0 gateway server is with iptables
> firewall. I am defining security rules based on mac
> address of 400 users.
> My server configure is 
> 1) Intel Pentium IV 2.4 Ghz processor.
> 2) 512 MB DD RAM
> 3) 40 GB hard disc.
> 
> Will it be able to server request of 400 users?
> I am doubtfull about performance of iptables firewall
> for this load but want to avoid commercial firewall.
> 
> Has anybody used Iptables firewall for this user
> traffic or more than this.
> Please guide me for same.
> 
> Thanks for support.
> 
> 
> slow fireawll Can someone give ideaWhat 

what size pipe are you trying to firewall?  while the number of users
behind a firewall is relevant--the amount of bandwidth that needs to be
filtered has more of an influence on the performance requirements.

1000 users behind a firewall with a T1 connection can only ever push
1.54 Mbps through the firewall--which is nothing.

100 users behind a firewall with a OC-3 connection would have a
drastically greater hardware requirement.

in any case--a P4 2.4 with 512 MB of RAM is pretty healthy box.  and in
the grand scheme, 400 users isn't really a huge amount.  i have a P3 800
MHz with 384 MB of RAM server-class machine on a 4 Mbps connections for
about that many users that isn't breaking a sweat.

-j 
 
-- 
Jason Opperisano <opie@817west.com>


