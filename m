From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: RE IPTABLES && Invalid Argument
Date: Mon, 24 Mar 2003 10:43:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C8C@hslex01.hslbz.local>
References: <200303232005.15994.matteo.king@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303232005.15994.matteo.king@libero.it>
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

> How to recompile iptables??. Beacuse i try to recompile do : 
> make KERNEL_DIR 
> but it return this error : EXTENSION FOUND .......... 

What if you do a "make clean" in the iptables build dir first, end then
try to compile with "KERNEL_DIR=<path/to/kernel> make" ?


Rob


