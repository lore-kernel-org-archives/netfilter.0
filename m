From: <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: Bridge question
Date: Fri, 17 Oct 2003 09:39:34 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310170839.h9H8dY8206228@alf1.lmb.internal>
References: <200310162115.00685.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310162115.00685.Herman@AerospaceSoftware.com> from Herman at
 "Oct 16, 2003 09:15:00 pm"
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
To: Herman@AerospaceSoftware.com
Cc: netfilter@lists.netfilter.org

Hi Herman,
We're using netfilter as a filtering bridge + NAT + local router between
us and the the local university router (via which we are attached to
*its* LAN) using proxy arp and iptables. It's been running happily for about
1.5 years (touch wood) supporting about 1200 hosts behind it.


Cheers,
Terry.


[Charset iso-8859-1 unsupported, filtering to ASCII...]
>Hi everybody,
>
>This question is not about iptables, but it is closely related, so somebody 
>might know the answer:
>I am trying to construct a bridge, to filter 802.1q tags and protect a legacy 
>version 2.2 kernel server, while preserving port to port security on the LAN, 
>using the VLAN module.
>
>Can anybody refer me to some documentation on filtering on a bridge for the 
>2.4 kernel?
>
>Regards,
>-- 
>Herman
>
>


