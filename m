From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help: Iptables rules
Date: Thu, 15 Jan 2004 23:27:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401152327.40094.Antony@Soft-Solutions.co.uk>
References: <OFA9978756.6595C97C-ON88256E1C.007F4A93-88256E1C.007F9D29@statsus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFA9978756.6595C97C-ON88256E1C.007F4A93-88256E1C.007F9D29@statsus.com>
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

On Thursday 15 January 2004 11:13 pm, Minh Cao wrote:

> Most of the net applications are working fine,  web browser, ftp, telnet,
> ssh, ping, Cisco VPN.
> I only have problem with VPN using PPTP protocol.
>
> Please let me know which modules to get pptp to work.

Well, er, the PPTP modules (now part of the standard kernel compile options, 
but see http://cvs.netfilter.org/netfilter-extensions/helpers/pptp for more 
technical details).

A Google search for "netfilter pptp" may help you considerably, I think.

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


