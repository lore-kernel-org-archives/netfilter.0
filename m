From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Transparent proxy question
Date: Mon, 15 Mar 2004 09:07:28 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403150907.28211.Antony@Soft-Solutions.co.uk>
References: <40556EE6.6040809@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40556EE6.6040809@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 15 March 2004 8:52 am, Sasa Stupar wrote:

> Hi!
>
> I have configure a transparent proxy and it is working fine. But now all
> requests to squid came from my nat box and I can't use my MAC acl
> anymore. Is there any option to provide to squid who is connecting and
> not the nat box which is used for transparency?

If you really mean MAC address based ACL, then no, you cannot use this to 
identify clients any more, because all the packets will be coming from the 
netfilter machine, so that is the only MAC address your proxy will know 
about.

If you actually mean source IP address based ACL, then you need to check your 
SNAT rule in the POSTROUTING chain of netfilter - make sure it is only 
applied to your external interface, not the interface where your proxy server 
is connected.

If you have a more complicated network setup than I am assuming, please supply 
a description or a diagram.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


