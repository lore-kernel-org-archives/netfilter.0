From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: RE: nat no traffic returns SOLVED
Date: Thu, 22 May 2003 20:55:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.0.0.25.0.20030522204510.04495500@pop.atz-hosting.nl>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C81@wardrive.citadelcom
 puter.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C81@wardrive.citadelcom
 puter.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

At 08:52 22-05-2003 +1000, George Vieira wrote:
> >You should add an SNAT rule, so your inside box is able to answer to the
> >outside connection from privat IP (10.0.0.112).
>This is not neccessary true, this isn't a requirement until the 10.0.0.112 
>machine needs to make the first move and make an outgoing connection 
>(SYN), only then you would need SNAT. DNAT connections should be handled 
>fine with ip_conntrack.

I want to thank the members of this list for the help provided in the last 
few days.

It turned out a co-worker removed the default gateway from the firewalled 
box. I will talk with him tomorrow and after then he will probably never 
touch the default gateway again unless he is really sure he's not going to 
get into trouble again.

Thanks,


B.


