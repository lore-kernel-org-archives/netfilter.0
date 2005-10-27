From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: ftp nat doesn't work for ipsec tunnel outgoinging packets
Date: Thu, 27 Oct 2005 10:38:18 +0200
Message-ID: <BAY103-F25626F96BEB46C7220D065B2680@phx.gbl>
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

Thanks a lot for the reply.
Just for record: ftp passive mode are working ok, only ftp active mode is 
failing. I have tested other protocol (telnet, smb, ms-sql, oracle) and they 
are ok.
So this problem is related to ip_conntrack_ftp and ip_nat_ftp



