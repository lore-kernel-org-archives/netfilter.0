From: Hans Wong <hansyywong@yahoo.com>
Subject: IPtable STRING match memory leakage problem in Redhat AS3 ??
Date: Wed, 23 Mar 2005 17:59:38 -0800 (PST)
Message-ID: <20050324015938.76256.qmail@web52405.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,
 
Does anyone encounter memory leakage problem of  
using IPtable STRING match extension? When I  
enable this extension,  the memory of the system 
drops 4k in every couple seconds when DROPping 
the matched package.  
Appreciated of any idea? Thanks! 
 
Best Regards
 
Hans 
 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
