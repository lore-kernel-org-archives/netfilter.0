From: Peter Hoeg <disposable1@hoeg.com>
Subject: Re: Firewalling non-IPsec connections
Date: Wed, 17 Dec 2003 23:02:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FE0D27B.9080900@hoeg.com>
References: <GFEPJIHHFOJDOFDMNAJDIEAGEKAA.mark@npsl.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <GFEPJIHHFOJDOFDMNAJDIEAGEKAA.mark@npsl.co.uk>
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
To: Netfilter List <netfilter@lists.netfilter.org>

Mark Weaver wrote:

>I have to guess so.  I've no idea TBH where the packets actually go, but
>this definitely works for me.  I'm more of a cook than a chef when it comes
>to netfilter.  I've tried looking around the source, but I'm pretty
>clueless, and the native ipsec doesn't seem to be documented at all.  It's
>not even got a maintainer listed, and virtually nothing in
>linux/Documentation.  (If anyone could point me in the right direction that
>would be great!).
>
mark, you simply rule! this fixed my problem. now, since i was going 
nuts trying to figure it out and i couldn't find ANY info on ANYWHERE 
(you guys were my last resort), so i have decided to make a small guide 
(i needed to learn docbook anyway so this seemed like a good chance) 
which can be found here:

http://hoeg.org/lri/

but one thing - to be honest i actually was thinking briefly about the 
MARK solution myself but came to the conclusion that since it is similar 
to the TOS marks you can set, then technically somebody else could tag 
the packets themselves before entering my system which would bypass the 
solution. and thats why i didnt take it further. can anybody shed any 
light on that?

but in order for the search engines to pick up this message: racoon 
linux kernel 2.6 ipsec vpn tunnel firewall iptables netfilter

>It kind of makes sense, because without this we'd have no possibility of
>handling packets that came in via an IPSC tunnel separately.
>
agree


