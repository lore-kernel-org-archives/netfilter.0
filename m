From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Configurationrequest for firewall with temporary ppp0-interface
Date: Thu, 30 Jun 2005 05:27:51 -0500
Message-ID: <200506300527.51460.rob0@gmx.co.uk>
References: <42C3BA1B.6070004@my-mail.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C3BA1B.6070004@my-mail.ch>
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

On Thursday 30 June 2005 04:23, Ruprecht Helms wrote:
> I've the problem that I need some rules for a temporary ppp0
> interface. This interface is only active then the admin has made a
> dial-up on the server and has activated a ppp-daemon.
>
> In the time the ppp0-Interface is up the connections should be able
> completely in both directions and through to clients. But this should
> only alowed for connections via ppp0.

If this is your only ppp+ interface it is easy. You can add your rules 
to the existing firewall and leave them there.

If there are other ppp+ interfaces which should be more restricted, it 
is only slightly more difficult. pppd(8) has a feature to run scripts 
when an interface goes active and inactive, /etc/ppp/ip-{up,down} 
respectively. Put your rules to open the interface in ip-up and to 
close it in ip-down. (Some distributors use ip-{up,down}.local for 
local additions.)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

