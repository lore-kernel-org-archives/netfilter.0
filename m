From: DurgaPrasad Adusumalli <adusumallid@gmail.com>
Subject: Performance of iptables with web proxy
Date: Mon, 17 Jan 2005 11:33:07 +0530
Message-ID: <75b657f40501162203456d5151@mail.gmail.com>
Reply-To: DurgaPrasad Adusumalli <adusumallid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I am using web proxy content filter (Dansguardian) to scan all
outgoing traffic from my LAN. I am using transparent proxying with an
iptable rule that forwards all outgoing traffic to web proxy. This
setup works but all the browsing activity gets slowed down. When I
configure my browser to use proxy Internet access gets faster.

Can someone suggest me how can I enhance the performance of iptables
with this rule is place and without configuring my browser to use
proxy.
 
Thanks in advance.
Durga Prasad.

