From: vineet bhargava <vineetbh@usc.edu>
Subject: setting up network sharing
Date: Fri, 15 Oct 2004 16:26:50 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <29c1c2ca23d24.416ffa4a@usc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I am having trouble setting up internet conenction sharing
on an embedded device. I am running linux kernel v2.4.18
with iptables and netfilter support. 

When I try to run this command -
iptables --table nat --append POSTROUTING --out-interface
wlan0 -j MASQUERADE

I am getting the following error -
iptables v1.2.2: Couldn't load target `MASQUERADE':File not
found

Try `iptables -h' or 'iptables --help' for more information.

Any pointers/ideas on this would be much appreciated.

Thanks,
Vineet


