From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: macro & iptables
Date: Wed, 31 Aug 2005 06:29:07 -0500
Message-ID: <200508310629.08059.rob0@gmx.co.uk>
References: <20050831035552.99400.qmail@web53305.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050831035552.99400.qmail@web53305.mail.yahoo.com>
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

On Tuesday 2005-August-30 22:55, Agung wrote:
> is it possible using macro *like pf did* with iptables

Since I don't know pf, you should explain more about what you want. No, 
I don't think iptables has any built-in macro capabilities, but you can 
use shell (or other) scripts to generate your rules. A script could 
either run all the iptables(8) commands in order, or it could generate 
iptables-save(8) format rules to be piped to iptables-restore(8) stdin.

> ?? while i'm googling i found nothing about this, any
> suggestion ?? :-)

Don't assume everyone else knows what your examples mean. Give detail.

Stick with pf if you know it and are comfortable.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

