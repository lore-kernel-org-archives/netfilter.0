From: kilobug@freesurf.fr (=?iso-8859-1?q?Ga=EBl?= Le Mignot)
Subject: Re: nmap
Date: Wed, 23 Oct 2002 09:35:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <plopm3d6q1sj3a.fsf@drizzt.dyndns.org>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<plopm31y6icovs.fsf@drizzt.dyndns.org>
	<20021022211221.3d91e4fb.fonetica@tiscali.it>
	<plopm3vg3ub2vw.fsf@drizzt.dyndns.org>
	<20021023003527.50af26db.fonetica@tiscali.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021023003527.50af26db.fonetica@tiscali.it> (antonio's
 message of "Wed, 23 Oct 2002 00:35:27 +0200")
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
To: antonio <fonetica@tiscali.it>
Cc: netfilter@lists.netfilter.org


Wed, 23 Oct 2002 00:35:27 +0200, tu as dit : 

 > OK but if I set the policy OUTPUT at DROP which ports/prot I have to set 
 > al ACCEPT?
 > This's my problem.

every dport/protocol you want to allow to be scanned... You cannot filter
much OUTPUT if you want to allow nmap.

You can use the -m owner with --cmd-owner if it's avaible on your computer
to allow "mmap" initiated connections. 

But... what do you want to do by filtering OUTPUT ? Sure, you can drop INVALID
packets, filter floods, stop packets coming from root and so on, but if you
want to allow normal internet activity from the box, you have to allow NEW
connections on OUTPUT to any host/port...

-- 
Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA

Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org

