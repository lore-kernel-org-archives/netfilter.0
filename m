From: Andrea Rossato <mailing_list@istitutocolli.org>
Subject: Re: ECN mangling
Date: Fri, 27 Dec 2002 12:14:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E0C361A.6040603@istitutocolli.org>
References: <20021227073624.GA1878@miggy.org> <20021227091659.GB1878@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021227091659.GB1878@miggy.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

there's a bug in that code: in the netfilter-devel mailing list a patch 
was posted:

 >      90                 diffs[0] = diffs[0] ^ 0xFFFF;
 >      91                 diffs[1] = *tcpflags;

that does the job.
andrea

Athan wrote:
>   Looking at latest CVS there doesn't seem to be any changes to the code
> in net/ipv4/netfilter/ipt_ECN.c.  Not being uptospeed with how the code
> all works it looks like it should be working:
> 
>      89         if (diffs[0] != *tcpflags) {
>      90                 diffs[0] = htons(diffs[0]) ^ 0xFFFF;
>      91                 diffs[1] = htons(*tcpflags);
>      92                 tcph->check = csum_fold(csum_partial((char *)diffs,
>      93                                                     sizeof(diffs),
>      94                                                     tcph->check^0xFFFF));
>      95                 (*pskb)->nfcache |= NFC_ALTERED;
>      96 
>      97                 return 1;
>      98         }
> 
> But it obviously isn't.
> 
> -Ath


