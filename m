From: kilobug@freesurf.fr (=?iso-8859-1?q?Ga=EBl?= Le Mignot)
Subject: Re: nmap
Date: Wed, 23 Oct 2002 14:02:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <plopm33cqxs6qt.fsf@drizzt.dyndns.org>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<plopm31y6icovs.fsf@drizzt.dyndns.org>
	<20021022211221.3d91e4fb.fonetica@tiscali.it>
	<plopm3vg3ub2vw.fsf@drizzt.dyndns.org>
	<20021023003527.50af26db.fonetica@tiscali.it>
	<plopm3d6q1sj3a.fsf@drizzt.dyndns.org>
	<014801c27a73$856bfdf0$583a29c4@ghome>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <014801c27a73$856bfdf0$583a29c4@ghome> ("Gavin"'s message of
 "Wed, 23 Oct 2002 12:06:49 +0300")
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
Content-Transfer-Encoding: 7bit
To: Gavin <gavin@raha.com>
Cc: netfilter@lists.netfilter.org


Wed, 23 Oct 2002 12:06:49 +0300, tu as dit : 

 >> But... what do you want to do by filtering OUTPUT ? Sure, you can drop
 > INVALID
 >> packets, filter floods, stop packets coming from root and so on, but if
 > you
 >> want to allow normal internet activity from the box, you have to allow NEW
 >> connections on OUTPUT to any host/port...

 > There's always a (good) chance that someone will comprimise the machine and
 > use it to DDOS, scan, spam etc - filtering output to allow only what you
 > need for normal usage (dns, web, ping etc) makes it less useful as a hacked
 > box.

If you allow users to mail, you allow them to spm. If you allow users to send
requests on tcp 80, you allow them to participe in a DDOS, and so on.
There is no real way to sort  out "clean" and "bad" actions at the firewall
level... The only thing you can do is using the 'limit' macth to prevent
some kinds of DoS. And allowing only some ports can be very limitating
for users, since some web servers listenon other ports, they may want to use
cvs pserver (and you didn't think to allow 3128) and so on...

-- 
Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA

Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org

