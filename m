From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall question...
Date: Tue, 30 Mar 2004 08:56:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403300856.27236.Antony@Soft-Solutions.co.uk>
References: <20040330005904.81980.qmail@web41401.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040330005904.81980.qmail@web41401.mail.yahoo.com>
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

On Tuesday 30 March 2004 1:59 am, V. A.H. wrote:

> Hello,
>
> Considering the folowing network scheme:
>
> Internet (Different ISP)
>
> Subnet Y (10.0.0.0/20)
>
>  (eth0)
> Firewall
>  (eth1)
>
> My Subnet(10.0.1.0/24)
>
> Firewall/Router(SNAT)
>
> Internet (My ISP).
>
> I have to filter all traffic between Subnet Y and My Subnet with a firewall
> box. And I don't know how to forward this traffic between those two
> interfaces presented in this scheme.

You don't need to do anything special on the top firewall shown here - what 
you need to do is make sure the bottom firewall (which I assume is the 
default route for the machines in your Subnet 10.0.1.0/24) has a route for 
Subnet Y pointing to eth1 as the next hop.

The top firewall just needs to know about the two networks on either side of 
it, which is automatic under Linux - it will only need a default gateway of 
its own if it needs to contact the Internet for its own reasons (eg DNS?).

If this still isn;t quite clear to you, repost your diagram with all IP subnet 
addresses shown, and IP addresses for each interface.   Then I can give a 
clearer answer.

Regards,

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


