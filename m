From: Rio Martin <rio@martin.mu>
Subject: iptables STRING.patch
Date: Thu, 6 May 2004 16:01:21 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405061601.21058.rio@martin.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Dear folks,
I ve tried this patch for my iptables. All run smoothly except for mangle 
table. Does anyone able to confirm this patch working with mangle table?
FYI, i put packets matching for some string into mangle to slow the speed. I 
still hope this patch usefull to prevent virus spread wich can consume lots 
of bandwidth usage.

Thanks..

Regards,
Rio Martin.


