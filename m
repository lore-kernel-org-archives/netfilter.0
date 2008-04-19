From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Problem blocking a large list of ip ranges using netfilter with
 ipranges
Date: Sat, 19 Apr 2008 15:28:16 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0804191523370.16549@mail3.jubileegroup.co.uk>
References: <D6EFEA32-5FA6-46C3-91DB-7E06446DCFCF@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D6EFEA32-5FA6-46C3-91DB-7E06446DCFCF@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi theere,

On Sat, 19 Apr 2008, Jesse Harris wrote:

> Recently I have needed to block a large list of ip address ranges.
> Firstly, I'm not sure if iptables is really suited to this, I don't
> know how long it takes for a packet to be parsed down a very long list
> of chains.

I wouldn't use long lists of iptables rules for this, I'd use ipsets.

> Has anyone used iptables in this way before?
> PS, there are about 2033 ip ranges to be blocked.

Using ipsets I routinely block 40,000+ networks (mostly /24) on very
modest hardware.

--

73,
Ged.
