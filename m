From: Erik Bourget <erik@midmaine.com>
Subject: Re: iplimit
Date: Fri, 30 Jan 2004 23:47:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <874quchgh9.fsf@loki.odinnet>
References: <MDBBKGIIDBFKOMNNKBCDIEOCCAAA.dhyanesh@intafrica.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <MDBBKGIIDBFKOMNNKBCDIEOCCAAA.dhyanesh@intafrica.com> (Dhyanesh
 Ramaiya's message of "Sat, 31 Jan 2004 07:17:32 +0300")
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
To: Dhyanesh Ramaiya <dhyanesh@intafrica.com>
Cc: netfilter@lists.netfilter.org

"Dhyanesh Ramaiya" <dhyanesh@intafrica.com> writes:

> Dear all,
>
> I am having difficulties in getting iplimit to work. I have iptables 1.2.7a
> and kernel 2.4.20. iplimit is compiled in the kernel. However, whenever I
> try to run the rule below it gives the error "iptables: No
> chain/target/match by that name":
>
> iptables -A INPUT -p tcp --syn --destination 1.2.3.4 --dport 80 -j DROP -m
> iplimit --iplimit-above 4
>
> Please advise off the mailing list as temporarily I have disabled to receive
> Netfilter's member posts.

Try using connlimit from latest patch-o-matic and iptables-1.2.9.  I am using
this combination with great success.

PS - Whovever made the connlimit patches, thanks!

- Erik


