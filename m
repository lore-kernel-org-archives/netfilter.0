From: kilobug@freesurf.fr (=?iso-8859-1?q?Ga=EBl_Le_Mignot?=)
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 17:03:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <plopm3isnshj1n.fsf@drizzt.kilobug.org>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	<200309161256.15286.gdh@acentral.co.uk>
	<1063716386.31093.160.camel@raylinux.internal>
	<20030916131153.GA16559@cannon.eng.us.uu.net>
	<1063720447.31093.166.camel@raylinux.internal>
	<20030916141505.GB16559@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916141505.GB16559@cannon.eng.us.uu.net> (Ramin Dousti's
 message of "Tue, 16 Sep 2003 10:15:05 -0400")
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Ray Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>


 >> > > Yeah, connection tracking automagically implies state inspection.
 >> > 
 >> > OK. Thanks for the informative comments but can you lay out the
 >> > steps to prevent stateful inspection? For example, how to unload
 >> > "ip_conntrack" and to prevent it from being reloaded again?
 >> > 
 >> Personally, I would re-compile the kernel without connection tracking
 >> support.

 > OK. If you recompile without conntrack, can you do NAT? I'm just wondering?

no, Netfilter's NAT relies upon the conntrack.

Can I ask you why do you want  to turn off the conntrack ? If it's for
speed or memory  reasons, then using NAT will  have a similar overhead
(maybe  not exactly  the same,  but similar)  anyway. When  you  NAT a
connection, you're  forced to  keep track of  the connection a  way or
another, to NAT further packets of the connection the same way.

-- 
Gael Le Mignot "Kilobug" - kilobug@nerim.net - http://kilobug.free.fr
GSM         : 06.71.47.18.22 (in France)   ICQ UIN   : 7299959
Fingerprint : 1F2C 9804 7505 79DF 95E6 7323 B66B F67B 7103 C5DA

Member of HurdFr: http://hurdfr.org - The GNU Hurd: http://hurd.gnu.org

