From: "Gavin" <gavin@raha.com>
Subject: Re: nmap
Date: Wed, 23 Oct 2002 12:06:49 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <014801c27a73$856bfdf0$583a29c4@ghome>
References: <1035264046.15391.85.camel@hyperno><20021022174245.13d2766b.fonetica@tiscali.it><plopm31y6icovs.fsf@drizzt.dyndns.org><20021022211221.3d91e4fb.fonetica@tiscali.it><plopm3vg3ub2vw.fsf@drizzt.dyndns.org><20021023003527.50af26db.fonetica@tiscali.it> <plopm3d6q1sj3a.fsf@drizzt.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

> But... what do you want to do by filtering OUTPUT ? Sure, you can drop
INVALID
> packets, filter floods, stop packets coming from root and so on, but if
you
> want to allow normal internet activity from the box, you have to allow NEW
> connections on OUTPUT to any host/port...

There's always a (good) chance that someone will comprimise the machine and
use it to DDOS, scan, spam etc - filtering output to allow only what you
need for normal usage (dns, web, ping etc) makes it less useful as a hacked
box.

Gavin



