From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: 2 dif. connections separated
Date: Tue, 20 Jul 2004 15:23:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407201523.38637.Antony@Soft-Solutions.co.uk>
References: <20040720141324.GA27925@omega.lacnic.net.uy>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040720141324.GA27925@omega.lacnic.net.uy>
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

On Tuesday 20 July 2004 3:13 pm, Pablo Allietti wrote:

> i have 2 router to internet 1 for 200.40.226.65 and other with
> 200.40.224.65
>
> is possible to divide this connections to make
>
> 200.40.226.64 // outgoing traffic
>
> 200.40.224.64 // input traffic ???
>
> with iptables ?

Yes.   Set the default gateway for the router to point up 200.40.226.64's 
link, and use SNAT to set all packets to have source address 200.40.224.65.

Then hope the ISP doesn't do strict ingress / egress filtering... :)

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


