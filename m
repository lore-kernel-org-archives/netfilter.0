From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 14:12:55 -0500
Message-ID: <200506201412.55396.rob0@gmx.co.uk>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0506202049130.32230@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506202049130.32230@yvahk01.tjqt.qr>
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

On Monday 20 June 2005 13:50, Jan Engelhardt wrote:
> I'd recommend a -P DROP anyway and build up -j ACCEPTs from there.

Not easy to do that without connection tracking.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

