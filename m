From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: pom for timeout fix failing
Date: 26 Mar 2003 00:36:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048635402.14737.84.camel@tux.rsn.bth.se>
References: <3E80A4D8.8010000@ucdavis.edu>
	 <1048624877.14737.55.camel@tux.rsn.bth.se>  <3E80C8A8.8030800@ucdavis.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E80C8A8.8030800@ucdavis.edu>
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

On Tue, 2003-03-25 at 22:22, Stephen Lawrence Jr. wrote:
> Ok, so I downloaded 2.4.20 from kernel.org, installed the submitted and 
> pending patches, then tried again and the same thing happened, the patch 
> failed.
> 
> Is there any way to find out why it is failing?

Yes, the patch wasn't updated to match two new patches in submitted/
I've updated it so it should work now.

-- 
/Martin

