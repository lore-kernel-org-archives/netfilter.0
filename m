From: antonio <fonetica@tiscali.it>
Subject: Flag each rule
Date: Sun, 17 Nov 2002 13:03:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021117130335.30faacfa.fonetica@tiscali.it>
References: <FD8F124A387AD6119F7900A0D218B321487EAB@hslex01.hsl-brabantzuid.nl>
	<FD8F124A387AD6119F7900A0D218B3210199A1@hslex01.hsl-brabantzuid.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B3210199A1@hslex01.hsl-brabantzuid.nl>
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

Hi to all 
The -j mark is only valid in the mangle table and will not work outside there.But there is a similar command that work in the nat table or in the filter table, in order to give a "flag" to some rules of my firewall?
Thx to all 


