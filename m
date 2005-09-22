From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transparent bridge with layer7 filter ?
Date: Wed, 21 Sep 2005 23:28:54 -0500
Message-ID: <43323306.2070100@riverviewtech.net>
References: <432EFAC2.8000306@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432EFAC2.8000306@pason.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Gale wrote:
> Hello,
> 
> I want to setup layer7 filter (http://l7-filter.sourceforge.net/) on a 
> Linux box that will be transparent to the network. I have looked up 
> transparent bridging any have found several ways to do this but non 
> mention layer7 filter. Some like ebtables (ebtables.sourceforge.net) 
> make it seem like you can not do this ?

Try taking a look at EBTables (bridging) with "Bridged IP/ARP packets filtering" enabled in the kernel as well as the Layer7 patch.  I think this will allow you to use the IPTables rules to see bridged traffic and thus you can run the layer 7 filter against it.



Grant. . . .

