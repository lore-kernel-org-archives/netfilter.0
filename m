From: Luca Bedogni <ml@lucabedogni.it>
Subject: Does netfilter fragments packect exceeding MTU
Date: Thu, 4 Jan 2007 13:21:40 +0100
Message-ID: <200701041321.41095.ml@lucabedogni.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi
	i'm trying to find out what i've said on topic. I've taken a look at this 
mail:
http://lists.netfilter.org/pipermail/netfilter/2000-August/004878.html
So i think that if you pass a packet to POSTROUTING taht exceeds MTU, 
netfilter will try to send it anyway right? Because you have to fragment 
before, 'cos netfilter doesn't expect a packet exceeding MTU right?
But that fragmentation how could be done? I've seen in the above mail some 
C-code building a fragmentation module for doing this, but it's not included 
in the official kernel tree?

Another question: in this mail i've not understood if fragmentation is done by 
such module or by a /proc entry; the mail it's quite old, so what's the 
situation actually?

thanks for any RTFM or help :)

Regards
-- 
Debian Powered GNU/Linux User #373118
Bedogni Luca - 	Blog | http://blog.lucabedogni.it
		        Site | http://www.lucabedogni.it
Debianizzati - www.debianizzati.org | Founder Member
--
Token Ring, n.: a local area network architecture, perhaps a future
replacement for SNA. Not to be confused with the Tolkien Ring, although
the purposes are similar: "One Ring to rule them all, one ring to find
them, one ring to bring them all and in the darkness bind them, in a LAN
with more nodes where the stations lie." 

