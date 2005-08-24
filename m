From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: /dev/rob0 Need to secure up server. But want to use qmail
 sending and php mx functions
Date: Wed, 24 Aug 2005 07:58:09 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508240756140.16890@yvahk01.tjqt.qr>
References: <0MKwtQ-1E7VDR2DXS-0007hK@mrelayeu.kundenserver.de>
	<200508230606.15882.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200508230606.15882.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org


>Experiment with LOG rules to see what other external connections are 
>being initiated. Perhaps you will find that your PHP has already been 
>0wn3d. ;)

... which led me to use
 -t filter -A OUTPUT -m owner --uid-owner wwwrun -p tcp --dport 25 -j REJECT

if someone really wants a mail-sending forum or stuff, that particular 
company/etc. will have to provide two servers for 80/25 :P But for 
"just webpages, but with PHP" this seems ideal.



Jan Engelhardt
-- 

