From: Florin Andrei <florin@andrei.myip.org>
Subject: ToS and Windows
Date: Sat, 24 Jul 2004 23:01:18 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090735278.4548.10.camel@rivendell.home.local>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Slightly offtopic.

I'm using "-j TOS --set-tos" with apparently good results. I manage to
control the ToS on the packets sent by a Linux box to a couple Windows
boxes.
The problem is that the packets sent back by the Windows machines do not
have ToS set. How do i set ToS on Windows?
One of the Win systems is Win2K, the other is WinXP.

-- 
Florin Andrei

http://florin.myip.org/


