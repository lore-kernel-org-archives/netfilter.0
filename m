From: "Stephen Lawrence Jr." <slawrence@ucdavis.edu>
Subject: Re: pom for timeout fix failing
Date: Tue, 25 Mar 2003 13:22:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E80C8A8.8030800@ucdavis.edu>
References: <3E80A4D8.8010000@ucdavis.edu> <1048624877.14737.55.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

Ok, so I downloaded 2.4.20 from kernel.org, installed the submitted and 
pending patches, then tried again and the same thing happened, the patch 
failed.

Is there any way to find out why it is failing?

Martin Josefsson wrote:

>Yes, you are trying to use patch-o-matic on a RH kernel. That isn't
>tested and won't be supported. Many patches in patch-o-matic requires
>that you apply all patches in pending and submitted (./runme pending and
>apply all those patches).
>This will almost certainly fail with a RH kernel. You are on your own.
>
>  
>

-- 
Stephen Lawrence Jr. - Programmer II
California Animal Health & Food Safety Laboratory System, UC Davis 
(530)-752-4614




