From: netfilter@rigacci.org
Subject: ip_conntrack_ftp as a module or built-in?
Date: Tue, 22 Nov 2005 11:47:02 +0100
Message-ID: <20051122104702.GC27443@rigacci.org>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

sorry for this generic question, but I searched long, without any 
clue.

On my linux box I load the ip_conntrack_ftp module with some 
parameter (to let the HylaFAX daemon talk with the clients):

    insmod ip_conntrack_ftp ports=21,4559

Is there a way to pass that "ports" parameter to the kernel, if 
the feature is compiled into the kernel, instead of as a module?

May be this is a generic modprobe question...

Thank you anyway.

-- 
Niccolo Rigacci
Firenze - Italy

