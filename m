From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Windows Update through Mandrake firewall
Date: Wed, 11 Feb 2004 19:37:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402111937.17191.Antony@Soft-Solutions.co.uk>
References: <1076479135.2747.44.camel@raylinux.internal> <402A35FA.11068.EBAD7F@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <402A35FA.11068.EBAD7F@localhost>
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

On Wednesday 11 February 2004 7:02 pm, cbaker@bbbscentralohio.org wrote:

> I am having trouble running Windows Update through a Mandrake
> Multi Network Firewall. I have already asked for help in several other
> forums.
>
> I am able to browse other web sites just fine. The Windows Update site
> appears to fail up when I checks my PC for updates. Microsoft's site
> support site said that I should "disable the firewall."

Hahahaha :)   Wonderful recommendations from Microsoft once again!!

> What ports do I need to open? What rules do I need to have? Could
> this be a Squid issue (our web proxy server)?

Possibly it's a Squid issue, however you should be able to tell that easily 
enough from your Squid logs - see what request comes in from the client, 
whether a response is obtained from the server, and what the status code is.

If in fact it's a netfilter problem, you can find out what ports are being 
blocked (and need to be opened for WinUpdate to work) by adding a LOG rule at 
the end of your FORWARD chain (just before the default DROP policy), and 
seeing what packets get caught (just before being discarded).   If you see 
too much to make sense of it, narrow down the logging rule by specifying the 
source address of the client making the request (this will need to bypass the 
Squid proxy, obviously, otherwise you'll just see the proxy's address, 
however I don't know whether your Squid is on the internal LAN or on a DMZ 
port of your Firewall).

Hope this helps to point you in the right direction,

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


