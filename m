From: Toby <tobia.conforto@linux.it>
Subject: Re: iptables query
Date: Fri, 25 Mar 2005 09:54:47 +0100
Message-ID: <20050325085447.GA30284@ikkoku.ath.cx>
References: <6c2d1c9d05032421374d594338@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c2d1c9d05032421374d594338@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

shardul Adhikari wrote:
> iptables -A PREROUTING -t nat -i eth0 -d 202.75.112.3 --dport 8080 -j
> REDIRECT --to-port 3128

I don't see "-p tcp" in that rule.  You can use --dport or --sport only
if you specify "-p tcp" or "-p udp".

For this reason, that rule will give you an error if you try and run it.
Before you correct your mistake, you should look for the error message
and see where it is displayed, so that you can more easily discover
future mistakes and problems.


Toby

-- 
Love(n): The delusion that one woman differs from another.
						H.L. Mencken

