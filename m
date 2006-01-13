From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ssh rule
Date: Fri, 13 Jan 2006 12:48:00 -0600
Message-ID: <200601131248.00795.rob0@gmx.co.uk>
References: <20060113101651.88870.qmail@web33404.mail.mud.yahoo.com>
	<uiz3bjsfmm2.fsf@false.linpro.no>
	<64313.193.173.147.3.1137150421.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64313.193.173.147.3.1137150421.squirrel@webmail.sterenborg.info>
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

On Friday 2006-January-13 05:07, Rob Sterenborg wrote:
> Or just (re)set the OUTPUT policy to ACCEPT. If you don't know how to
> deal with it, it just get's in your way.

That's my rule of thumb: anyone who has to ask how to make OUTPUT work 
with a DROP policy does not know enough to make that policy useful. 
Just say "iptables -P OUTPUT ACCEPT" and focus your efforts in a more 
productive direction.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

