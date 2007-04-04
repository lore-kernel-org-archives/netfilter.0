From: "noa levy" <noalevy@hotmail.com>
Subject: RE:  re: stateful UDP with unknown source port on INPUT?
Date: Wed, 04 Apr 2007 12:14:57 +0300
Message-ID: <BAY121-F24F8FB198A2F8143004F2DA9660@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanks all for your help. I'm trying to create the rules using the Recent 
match now, and was wondering if there was a way to look at the recent list 
so I could see what's actually in there to help testing and debugging?
Noa

>Message: 10
>Date: Sun, 1 Apr 2007 15:24:00 +0200
>From: Franck Joncourt <franck.joncourt@wanadoo.fr>
>Subject: Re: stateful UDP with unknown source port on INPUT?
>To: netfilter@lists.netfilter.org
>Message-ID: <20070401132400.GJ7936@toystory.lan>
>Content-Type: text/plain; charset="utf-8"

>On Sun, Apr 01, 2007 at 03:39:30PM +0300, noa levy wrote:
>>Thanks!
>>I forgot to mention, though, that my source port for the SNMP informs is 
>>also random, so I can't match against the destination port for the 
>>incoming packet - does the recent target also maintain a port list or is 
>>it IP addresses only?
>>

From the iptables tutorial :

>iptables -A INPUT -m recent --name example --rsource
>The --rsource match is used to tell the recent match to save the source
>address and port in the recent list. This is the default behavior of the
>recent match.

>iptables -A INPUT -m recent --name example --rdest
>The --rdest match is the opposite of the --rsource match in that it
>tells the recent match to save the destination address and port to the
>recent list.

>http://iptables-tutorial.frozentux.net/iptables-tutorial.html#RECENTMATCH


>--
>Franck Joncourt
>http://www.debian.org
>http://smhteam.info/wiki/
>GPG server : pgpkeys.mit.edu
>Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE
>-------------- next part --------------
>A non-text attachment was scrubbed...
>Name: not available
>Type: application/pgp-signature
>Size: 189 bytes
>Desc: Digital signature
>Url : /pipermail/netfilter/attachments/20070401/291d45b9/attachment.pgp

------------------------------

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


