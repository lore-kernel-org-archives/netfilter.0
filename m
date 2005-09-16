From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: weird iptables behaviour
Date: Fri, 16 Sep 2005 01:15:05 -0500
Message-ID: <200509160115.05246.rob0@gmx.co.uk>
References: <20050915214651.76113.qmail@web60914.mail.yahoo.com>
	<432A5C09.5000105@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432A5C09.5000105@riverviewtech.net>
Content-Disposition: inline
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

On Friday 2005-September-16 00:45, Grant Taylor wrote:
> > On the openvpn box, FORWARD policy is DROP, so I did
> > "iptables -I FORWARD -i tap0 -j ACCEPT" and thought this
> > should do the trick. But I was wrong. The only solutions I
>
> First of all you will need to have a corresponding rule:
>
> iptables -I FORWARD -o tap0 -j ACCEPT
>
> To allow traffic in the reverse direction too.

Better yet, the usual stateful rule:
iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

