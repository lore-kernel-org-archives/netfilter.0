From: Ales Stibal <astib@giganet.cz>
Subject: Re: Drop firstly? Drop at the end of the Script? Or it doesn't matter?
Date: Mon, 24 Mar 2003 16:43:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E7F279A.9070303@giganet.cz>
References: <000801c2ef5b$e3e3ba50$0400000b@laptopbak1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2ef5b$e3e3ba50$0400000b@laptopbak1>
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
To: giannhsp <giannhsp@oslab.teipir.gr>
Cc: netfilter@lists.netfilter.org

>     

hi,

> Is it better to put the command tha sets the default policy (DROP in 
> my case) to the beginning of the script and then writing the ACCEPT 
> section or the opposite?

IMO is better to set DROP as default policy and allow only the traffic 
you *really* need.
I use DROP for INPUT and FORWARD. I have ACCEPT for OUTPUT on my home box.
This approach will fit nearly all easy installations.

What do you plan to deploy on "netfiltered" machine?

regards,
    Astib();

-- 
A l e s  S t i b a l, Wintel free, powered by AthlonXP and Gentoo Linux.
<astib@giganet.cz> Giganet.cz community network, Litomerice, Czech Republic




