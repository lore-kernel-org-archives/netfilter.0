From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: browsing the "network 'hood" from LAN <-> DMZ
Date: Fri, 05 Dec 2003 07:33:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070627609.2057.330.camel@grendel>
References: <FDB52A0429DFD31196FB0008C7D972D50EA57B91@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA57B91@OST_EXCH_USR5>
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
To: "Knight, Steve" <Steve.Knight@bskyb.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-12-05 at 07:12, Knight, Steve wrote:
>
> I'm trying to get the LAN to be able to NBT browse the boxes in the DMZ, but
> they won't.  I'm permitting all TCP and UDP from LAN to DMZ and back again
> ...  It looks like NetBIOS isn't going to and from eth0-eth1.

First off this is a ***BAD*** idea. You've just removed all security a
DMZ can provide and IMHO you are not much better off than if hosted the
servers on your internal network.

Now with all that said, on the internal network edit the lmhosts file
and add an entry for the system(s) on the DMZ. That or you could setup a
WINS server and point all your systems at it.

HTH,
C



