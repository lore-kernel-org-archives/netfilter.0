From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Sat, 24 Jul 2004 18:17:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241817.43057.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC90511F0@asimail2.alphanumeric.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90511F0@asimail2.alphanumeric.com>
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

On Saturday 24 July 2004 5:58 pm, Jason Opperisano wrote:

> Antony-
>
> I know you say SNAT in the explanation, but a rogue D made it into the
> example rule...  stupid S & D right next to each other...
>
>   iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to 62.160.X.Y

Thanks :)   That *is* what I meant, yes.

At least this error would be picked up by netfilter too, if someone tried to 
use the command I'd mistyped.

You'd think they would have put Source and Destination further apart on the 
keyboard.....   huh.

Regards,

Antony.

-- 
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the list;
                                                           please don't CC me.


