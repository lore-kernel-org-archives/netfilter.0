From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: pom for timeout fix failing
Date: 25 Mar 2003 21:41:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048624877.14737.55.camel@tux.rsn.bth.se>
References: <3E80A4D8.8010000@ucdavis.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E80A4D8.8010000@ucdavis.edu>
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
To: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-03-25 at 19:50, Stephen Lawrence Jr. wrote:
> I am trying to apply the extra/ip_conntrack_tcp_timeouts fix to my 
> RedHat 7.3 machine. I have installed the latest kernel-source RPM 
> (kernel-source-2.4.18-27.7.x), and I ran "./runme extra, told it the 
> source was in /usr/src/linux-2.4, and selected "T" to test the patch. It 
> says:
> 
> Testing patch extra/ip_conntrack-timeouts.patch...
> Failed to patch copy of /usr/src/linux-2.4
> 
> Am I doing something wrong here?

Yes, you are trying to use patch-o-matic on a RH kernel. That isn't
tested and won't be supported. Many patches in patch-o-matic requires
that you apply all patches in pending and submitted (./runme pending and
apply all those patches).
This will almost certainly fail with a RH kernel. You are on your own.

-- 
/Martin

