From: michael@heimic.net
Subject: Re: Strange problem with iptables and ip ranges with leading 0's 
     (works sometimes, but not other times)
Date: Tue, 30 Sep 2003 21:24:07 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <52859.202.95.92.167.1064975047.squirrel@webmail.heimic.net>
References: <51395.202.95.92.167.1064971605.squirrel@webmail.heimic.net>
    <1064973377.9055.580.camel@alpha.newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1064973377.9055.580.camel@alpha.newkirk.us>
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
To: firewalldude@newkirk.us
Cc: michael@heimic.net, netfilter@lists.netfilter.org

> On Tue, 2003-09-30 at 21:26, michael@heimic.net wrote:
> The leading 0's are interpreted as indicating an octal number, rather
> than decimal.  (This means your 202.007.077.0 that was accepted, if you
> list the rule back, will show 202.7.63.0/24 being ACCEPTed)  I don't see
> it documented anywhere as behaving this way, but that's clearly what is
> happening.  077=63, 0100=64, 078=Undefined, like trying to interpret
> 0x1A (the 'x' indicates hexadecimal) in decimal - the 'A' has no
> meaning, just like any digit 8 or higher has no meaning in octal.


Thanks very much for that. I didn't think it could be seeing it as a octal
number.

Explains a lot now.

Thanks once more


