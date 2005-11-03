From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: NAT between incomming PPP and office network
Date: Thu, 3 Nov 2005 19:38:16 +0100
Message-ID: <49658.1730469645$1131043197@news.gmane.org>
References: <e63dd3500511031025j4959dbcfhc0c8692ca6a915be@mail.gmail.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e63dd3500511031025j4959dbcfhc0c8692ca6a915be@mail.gmail.com>
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

http://iptables-tutorial.frozentux.net could not find a better one ;)

I hope you know how to manage tables by now. The point is - you should
define an INPUT and OUTPUT table for all ppp interfaces that you will be
created as users connect to your box. Then you should allow traffic to be
forwarded between ppp+ ( it stands for ppp1 and ppp2 and ppp3 etc ) and your
external interface. If you already have a rule for MASQ - it should be
working. In my setup I masquerade only IP addresses of connected clients.
Those who are not connected with pptp dont get any internet access.

I hope I could help you ;) the rules shouldn't be to heavy to implement ;)

Regards,

Edvin

-----Original Message-----
From: Matthew Price [mailto:mandtprice@gmail.com] 
Sent: Donnerstag, 03. November 2005 19:26
To: edvin.seferovic@kolp.at
Subject: Re: NAT between incomming PPP and office network

On 11/3/05, Seferovic Edvin <edvin.seferovic@kolp.at> wrote:
> Hi,
>
> I've set up a similar box. I've used ip-up and ip-down scripts to
> enter/remove a rule that contains SNATing of ppp client address. Also I
have
> allowed traffic to be forwarded between ext_dev and ppp+, as well as INPUT
> and OUTPUT policies for ppp+ devices set to ALLOW. Maybe you've missed one
> of those.
>
> Regards,
>
> Edvin Seferovic
>

Thanks for the quick reply.  If you don't mind, what exactly would the
iptables command look like to accomplish those rules?  I've read so
many man pages and howto's that my head hurts, but is not fuller. :(

Is there a good source of info for the 2.6 iptables implementation? 
It seems everything is either really or just somewhat old.

Matthew


