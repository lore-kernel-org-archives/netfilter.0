From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Wol Magic Packets
Date: Thu, 24 Aug 2006 07:45:59 +0200
Message-ID: <000301c6c740$93b6e870$0101000a@tanjian>
References: <J4H7AL$3755F2FB0EF94967751D3C49D3390021@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <J4H7AL$3755F2FB0EF94967751D3C49D3390021@libero.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

claudio987@libero.it <mailto:claudio987@libero.it> wrote:
>> On Wed, August 23, 2006 11:33, claudio987\@libero\.it wrote:
>>> exsists a module that can recognize Magic packet used in wake on
>>> lan? 
>> 
>> No, not specifically.
>> 
>>> I'd like to drop Magic packets
>> 
...
>> 
>> Port 7/udp being echo and port 9/udp being discard, I don't see why
>> you couldn't block these ports. 
>> 
> 7 and 9 are default ports but Magica packets can also be
> trasmitted trought other ports:
> http://www.depicus.com/wake-on-lan/woli.aspx
> as you can see, here you can specify port number.

Yes. Well, I also received an email from Sietske van Zanen who thought
more thoroughly than I did, but he hit the wrong butten and it was not
sent to the list.
This was his answer and I have to agree with him:

[quote]
I do not see what use it is, to block this on your firewall. WoL is a
broadcast, hence it will already never traverse a firewall if it's
configured correctly. On the local LAN segment they will never pass a
firewall before reaching a LAN station. That's the whole idea of
broadcasting.
 
The best thing to do is disable WoL on the workstations.
 
-Sietse
[/quote]


Gr,
Rob


