From: Faheem Mitha <faheem@email.unc.edu>
Subject: Re: comments about lokkit default script
Date: Fri, 12 Sep 2003 15:01:17 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0309121456140.1054-100000@Chrestomanci>
References: <1063391915.5967.15.camel@smoogen1.lanl.gov>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063391915.5967.15.camel@smoogen1.lanl.gov>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smoogen <smoogen@lanl.gov>
Cc: netfilter@lists.netfilter.org



On Fri, 12 Sep 2003, Stephen Smoogen wrote:

>
> Basically to understand the script a bit better you should look at how
> the rules look in the table.
>
> iptables -nxvL
>
> should give you some output. If the default policies are to ACCEPT
> things then what is happening is that you are accepting ALL outbound
> traffic and very little inbound traffic. The newest
> redhat-config-firewall in their rawhide has some changes to this, but I
> have been doing custom firewalls for too long now to remember what they
> are (I think they put in an ESTABLISHED,RELATED rule in now.)
>
> Are you forwarding traffic through your firewall or just using it as a
> client. If you are using it as a client it is pretty ok and secure. If
> you are using it as a forwarder you will probably want to make some
> changes for interfaces to be semi-trusted.

I'm not sure what this means. The firewall is set up on my home computer's
kernel, which is also the only computer I have, no LAN (I think they call
it). As I understand it, all packets coming and going from my computer
pass through this firewall. I don't think I am doing any forwarding. Is
this done for other computers connected to the net through the firewall?

                                                                Faheem.


