From: Askar Ali <askarali@gmail.com>
Subject: Re: Defining ip range in a rule
Date: Mon, 20 Mar 2006 17:48:33 +0500
Message-ID: <441EA4A1.9010103@gmail.com>
References: <441E907F.4060107@mmcomputer.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <441E907F.4060107@mmcomputer.hu>
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
To: McDouglas <mcdouglas@mmcomputer.hu>
Cc: netfilter@lists.netfilter.org


>
> I'd like to ask how to define an ip address range in a rule. I don't
> mean using subnet mask but rather for example making a rule which will
> block port 110 for the 10.10.2.50-10.10.2.150 ip range.
>
for i in IpListDelimitedwithSpace
do
iptables -A INPUT -p tcp --dport 110 -s $i -J DROP

done

Askar.

