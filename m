From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: HELP PPTP CONNTRACK MULTIPLE CLIENTS
Date: Thu, 5 Dec 2002 14:58:25 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212051454220.11714-100000@localhost.localdomain>
References: <3DEF504A.F4099ACE@multitech.co.in>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DEF504A.F4099ACE@multitech.co.in>
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
To: Adharsh Praveen R <adarsh@multitech.co.in>
Cc: netfilter@lists.netfilter.org


Adharsh,

Philip has posted a patch to the netfilter patch-o-matic PPTP patch.  The
latter seems to apply well against the stock Linux kernel 2.4.20 from
kernel.org.  All it takes is patching the netfilter patch first, then
running the POM runme script with the extra parameter.

The PoPToP server itself may need a modification with regard to call ID
allocation, see

http://sourceforge.net/tracker/index.php?func=detail&aid=648880&group_id=44827&atid=441003

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117

On Thu, 5 Dec 2002, Adharsh Praveen R wrote:


> I saw a patch in December's list from Philip.
>
> I would like to know the steps involved in getting PPTP conntrack work.
>
> Which patch I should apply first, is it the one from netfilter.org
> pptp-conntrack-nat.patch?


