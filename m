From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: multiple source
Date: Wed, 31 Mar 2004 22:21:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403312221.15895.Antony@Soft-Solutions.co.uk>
References: <BAY15-F45vJd9o0PRxd0002ad8a@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F45vJd9o0PRxd0002ad8a@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 31 March 2004 10:05 pm, azeem ahmad wrote:

> hi all
> i want to make such a setup that the two ip 192.168.0.2 and 192.168.0.102
> from my lan should be MASQUERADEd and all the other addresses should be
> redirected to the proxy working on the same machine on port 8080

Please see my response to the last qiuestion on the list, which should tell 
you how to do what you want: 
http://lists.netfilter.org/pipermail/netfilter/2004-March/051649.html

> MASQs="192.168.0.2 192.168.0.102"
>
> for MASQ in $MASQs;
> do
> 	iptables -t nat -A POSTROUTING -s $MASQ -o ppp0 -j MASQUERADE
> done

The reason why this doesn't work is that it creates two rules for you; the 
first one says "for any address other than 192.168.0.2, MASQUERADE", the 
second one says "for any address other than 192.168.0.102, MASQUERADE".   
Every single address will match at least one of those rules, therefore 
everything gets MASQUERADEd.

Regards,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


