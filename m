From: Nicolas Cadilhac <cadilhac@cae.com>
Subject: iptables-save file syntax
Date: Thu, 10 Oct 2002 13:14:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <719A38AB7279D511B91900D0B7444A9E01EF58BB@caemsx03.cae.ca>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,

I wonder what are those numbers on these lines :

*nat
:PREROUTING ACCEPT [77070:3730176]
:POSTROUTING ACCEPT [2859:369253]
:OUTPUT ACCEPT [6476:595842]

sometimes it's 0:0 but since they are really big numbers they are not ports.
Also are these lines policies ?

Thanks





