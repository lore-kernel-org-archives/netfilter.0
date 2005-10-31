From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ftp nat doesn't work for ipsec tunnel outgoinging packets
Date: Mon, 31 Oct 2005 11:33:33 +0100
Message-ID: <BAY103-F3165D2045EE0381BB2D1A6B26C0@phx.gbl>
References: <Pine.LNX.4.61.0510261906090.27341@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510261906090.27341@filer.marasystems.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hno@marasystems.com
Cc: netfilter@lists.netfilter.org


Henrik Nordstrom wrote:

>On Tue, 25 Oct 2005, Marco Berizzi wrote:
>
>>Hello. I have a very strange problem with ftp.
>
>ipsec and iptables (especially with NAT) on the same box does not mix very 
>well yet.

I have patched & compiled linux 2.6.14 (vanilla) with ipsec-01-output-hooks 
from
POM-20051027 and the problem is solved: ftp active mode is working (through
an ipsec tunnel + nat).



