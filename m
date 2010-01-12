From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: REJECT as a default policy
Date: Tue, 12 Jan 2010 08:53:10 +0100
Message-ID: <4B4C2A66.3070405@chello.at>
References: <4B4B1339.1040502@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4B1339.1040502@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Lars Nooden <lars.curator@gmail.com>

On 11.01.2010 13:02, Lars Nooden wrote:
> I'd like to add the ability to use the REJECT target as a default policy
> to the netfilter / iptables wishlist.
> 
> Using REJECT as a default is currently possible as a kludge a few steps
> would be saved by allowing it as a default policy.  Perhaps that might
> even speed up some filtering in some cases.
> 
> A good (IMHO) discussion of DROP vs REJECT has been written by Peter Benie :
> 	http://www.chiark.greenend.org.uk/~peterb/network/drop-vs-reject
> 


imagine you get scanned / ddosed / synflooded. For every invalid packet
coming in, you send out an icmp packet. Your host and line could get
quite busy with just sending irrelevant responses, making the dos attack
even more successful.

you will not have control over how many (limit) and what type of icmp
error is through'n out (would need new policy handler).


that's why i personally prefer to DROP to untrusted, while placing
REJECT rules with a limit before the drop-policy, to trusted sides.

regards

Mart


