From: kilobug@freesurf.fr (=?iso-8859-1?q?Ga=EBl?= Le Mignot)
Subject: Re: nmap
Date: Tue, 22 Oct 2002 23:05:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <plopm3vg3ub2vw.fsf@drizzt.dyndns.org>
References: <1035264046.15391.85.camel@hyperno>
	<20021022174245.13d2766b.fonetica@tiscali.it>
	<plopm31y6icovs.fsf@drizzt.dyndns.org>
	<20021022211221.3d91e4fb.fonetica@tiscali.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021022211221.3d91e4fb.fonetica@tiscali.it> (antonio's
 message of "Tue, 22 Oct 2002 21:12:21 +0200")
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


Tue, 22 Oct 2002 21:12:21 +0200, tu as dit : 

 > Ok,but in order to set the policy at DROP,which port/protocols I have to set at ACCEPT to allow nmap from firewall box to anywhere nad from LAN to anywhere?

If you don't block OUTPUT and allow ESTABLISHED and RELATED packets in INPUT,
you don't need to open extra ports. Maybe some extra icmp for "weird" scans,
that's all.

-- 
Gael Le Mignot "Kilobug" - kilobug@freesurf.fr - http://kilobug.free.fr
GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA

Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org

