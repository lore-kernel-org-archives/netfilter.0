From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: RedHat 8.0 upgrade problem 1.2.8
Date: Tue, 26 Aug 2003 15:47:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826154732.3ce73dc3.arnt@c2i.net>
References: <20030826042806.GA32233@charles>
	<04d101c36b8c$fedd3810$2288e7c0@promed.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04d101c36b8c$fedd3810$2288e7c0@promed.com.au>
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

On Tue, 26 Aug 2003 14:46:21 +1000, 
"Stuart J. Browne" <stuart@promed.com.au> wrote in message 
<04d101c36b8c$fedd3810$2288e7c0@promed.com.au>:

> >-----Original Message-----
> >From: netfilter-admin@lists.netfilter.org 
> >[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> >Jason S. Friedman
> >Sent: Tuesday, 26 August 2003 14:28
> >To: netfilter@lists.netfilter.org
> >Subject: RedHat 8.0 upgrade problem 1.2.8
> >
> >
> >I use RedHat and use the Redhat-provided RPMs for all my 
> >server maintenance.

..this means you have _all_ erratas, no?  I opened
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=89171
and it was closed with a fix in initscripts-7.26-1, can 
anyone confirm this works?

> iptables 1.2.8 RPM's is listed as requring the newer kernel builds.
> They broke something, and sent out an erratta notification earlier (I
> got it this morning, but have not tried doing the updates yet).
> 
> I'm picking the kernel modules in memory are from the olde version,
> thus requring you to reboot into a newer kernel, or continue using the
> older iptables for the moment.
> 

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


