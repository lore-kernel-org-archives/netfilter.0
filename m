From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Network config review
Date: Thu, 29 Jul 2004 22:55:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407292255.57750.Antony@Soft-Solutions.co.uk>
References: <810BC538117E9F4E9BB152E0C100DF1F18F4A6@farmer.vikus.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F18F4A6@farmer.vikus.net>
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

On Thursday 29 July 2004 10:25 pm, Patrick Ahler wrote:

> I have a few questions about my current setup; if anyone would be so
> kind to take a look and let me know if there are any issues with the
> configuration. Thanks!

Instead of the output from "iptables -L", please post either your iptables 
rules (the script you use to set up the ruleset) or else the output from 
"iptables -L -nvx; iptables -L -t nat -nvx", since that tells us much more 
information, which is helpful.

More importantly, however, please tell us what you want your firewall to do 
(what to allow, what to block, that sort of thing) - then we can suggest 
opinions on whether your ruleset is a good way of achieving it.

Regards,

Antony.

-- 
It is also possible that putting the birds in a laboratory setting 
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

                                                     Please reply to the list;
                                                           please don't CC me.


