From: Alexey Nezhdanov <snake@penza-gsm.ru>
Subject: assimetric routing & connection tracking
Date: Mon, 17 Mar 2003 14:13:33 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E18usYl-0008QQ-00@kashyyyk.netfilter.org>
Reply-To: snake@penza-gsm.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello.

I have a question about subj:
I'm intending to set up an assimetric sheme of internet connection:
All outgouing traffic from intranet will be routed through ethernet 
connection and some incoming traffic will come from ppp interface:
<=-- local traffic --=>---[] <=-- eth0 -= >
                          [] <=-- ppp0 ----

Is the connection tracking able to properly handle such disbalance?
(rp_filter will be turned off on ppp0 since there will be no any route 
throwgh it)

-- 
Respectively
Alexey "Snake" Nezhdanov
JID & e-mail: snake@penza-gsm.ru



