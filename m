From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: Firewalling non-IPsec connections
Date: Tue, 16 Dec 2003 19:46:33 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDIEAGEKAA.mark@npsl.co.uk>
References: <200312161512.24688.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312161512.24688.Antony@Soft-Solutions.co.uk>
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
To: Netfilter List <netfilter@lists.netfilter.org>

> I'm intrigued by this.   If the packets are encrypted with ESP as they go
> through PREROUTING, but you need to MARK them in order to recognise which
> ones they are by the time they hit the INPUT chain, at what point
> does the
> decryption occur?   Does it mysteriously happen somewhere between the
> PREROUTING and INPUT chains?   (If it does, I can see an awful lot more
> puzzled newbies asking questions here once 2.6 takes off....)
>
I have to guess so.  I've no idea TBH where the packets actually go, but
this definitely works for me.  I'm more of a cook than a chef when it comes
to netfilter.  I've tried looking around the source, but I'm pretty
clueless, and the native ipsec doesn't seem to be documented at all.  It's
not even got a maintainer listed, and virtually nothing in
linux/Documentation.  (If anyone could point me in the right direction that
would be great!).

It kind of makes sense, because without this we'd have no possibility of
handling packets that came in via an IPSC tunnel separately.

Mark


