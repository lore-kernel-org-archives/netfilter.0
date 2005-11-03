From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: NAT between incomming PPP and office network
Date: Thu, 3 Nov 2005 20:10:47 +0100
Message-ID: <43650.0636781149$1131045190@news.gmane.org>
References: <e63dd3500511031057p618620al4933a7d56099801d@mail.gmail.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e63dd3500511031057p618620al4933a7d56099801d@mail.gmail.com>
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

Well.. try it.. if it works - it accomplishes that what you wanted! Right?
I am a little bit paranoid so all my policies are set to DROP... and in the
chains I control what gets in/out/forwarded...

Regards,

Edvin

-----Original Message-----
From: Matthew Price [mailto:mandtprice@gmail.com] 
Sent: Donnerstag, 03. November 2005 19:58
To: edvin.seferovic@kolp.at
Subject: Re: NAT between incomming PPP and office network

On 11/3/05, Seferovic Edvin <edvin.seferovic@kolp.at> wrote:
> http://iptables-tutorial.frozentux.net could not find a better one ;)
>
> I hope you know how to manage tables by now. The point is - you should
> define an INPUT and OUTPUT table for all ppp interfaces that you will be
> created as users connect to your box. Then you should allow traffic to be
> forwarded between ppp+ ( it stands for ppp1 and ppp2 and ppp3 etc ) and
your
> external interface. If you already have a rule for MASQ - it should be
> working. In my setup I masquerade only IP addresses of connected clients.
> Those who are not connected with pptp dont get any internet access.
>
> I hope I could help you ;) the rules shouldn't be to heavy to implement ;)
>
> Regards,
>
> Edvin

To be sure that IP's don't get hijacked and that nothing from the WLAN
gets through, I also added:
iptables -P FORWARD DROP
iptables -I FORWARD -i ppp+ -j ACCEPT

It works; does this accomplish what I want?

One more clueless newbie,
Matthew


