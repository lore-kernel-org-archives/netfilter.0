From: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: block 8080, but redirect from 80 to 8080
Date: Tue, 01 Aug 2006 13:54:54 +0200
Message-ID: <44CF410E.6000802@freemail.hu>
References: <44CED45F.10208@xsoftware.biz> <44CF3120.4080008@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CF3120.4080008@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>


> Quick and dirty :
> Drop the undesired packets in the PREROUTING chain of the 'mangle' 
> table, before REDIRECT occurs.
>
> iptables -t mangle -A PREROUTING -p tcp --dport 8080 -j DROP (or REJECT)
>
I would recomment NOT TO DO any ACCEPT or DROP/REJECT in other than the
filter table...



