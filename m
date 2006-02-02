From: "robee" <mlody@elpec.com>
Subject: nf-hipac problem
Date: Thu, 2 Feb 2006 09:33:59 +0100
Message-ID: <001e01c627d3$a8d56d60$060010ac@CyberAdmin>
Reply-To: robee <mlody@elpec.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

-P option does not work. where is the problem? my rules looks like below:

<--------
nf-hipac -P INPUT DROP
nf-hipac -P OUTPUT DROP
nf-hipac -P FORWARD DROP
<--------


Robert Czechonski


