From: Ruprecht Helms <rhelms@my-mail.ch>
Subject: Re: problem with netfilter, ipsec and gre combination
Date: Sat, 06 Aug 2005 12:05:47 +0200
Message-ID: <42F48B7B.6010508@my-mail.ch>
References: <42F44612.2030605@milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42F44612.2030605@milivojevic.org>
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
To: Aleksandar Milivojevic <alex@milivojevic.org>, netfilter@lists.netfilter.org

Aleksandar Milivojevic wrote:

> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

What's that.
Basicly you first drop all CHAINS, because of the default policy.
After it you open the chains as needed.

Regards,
Ruprecht



----------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax +49[0]7621 16 99 16
Web: http://www.rheyn.de

