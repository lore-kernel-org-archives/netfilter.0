From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: What is the protocol number of NETBIOS over IEEE 802.2 ethernet?
Date: Mon, 14 Jun 2004 15:39:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406141539.54236.Antony@Soft-Solutions.co.uk>
References: <000001c451ed$a84bb790$1d01a8c0@palettemm.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c451ed$a84bb790$1d01a8c0@palettemm.com>
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

On Monday 14 June 2004 9:57 am, Bassam A. Al-Khaffaf wrote:

> Hi Guys,
>    I am trying to DNAT the netbios broadcast traffic (03:00:00:00:00:01)
> over IEEE 802.2 ethernet. So is there any number for this protocol so I
> can use it with my iptables rule?

IPtables means IP tables :)   If you're not using IP (over ethernet, or 
anything else as a transport medium), then you can't use IPtables to filter 
it.

Maybe you need to look at EBtables (Ethernet Bridge filtering) 
http://ebtables.sourceforge.net ?

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


