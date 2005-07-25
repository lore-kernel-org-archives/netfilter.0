From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: iptables-restore vs iptables-restore --noflush performance
Date: Mon, 25 Jul 2005 15:27:32 -0400
Message-ID: <42E53D24.2020203@SCampbell.net>
References: <63d3731e050725121353083b32@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <63d3731e050725121353083b32@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Joubert Berger wrote:
>Anyone know why I would get a big performance difference between
>"iptables-restore" and "iptables-restore --noflush"?
>
>I have 6600 rules.  If I load with iptables-restore, it takes about 30sec.
>If I use noflush, that turns in 1 min and 20+ seconds.
>
>--joubert
>
>  
Because you have 6600 rules and when you use no-flush you are adding 
another 6600?  If you do it several
times in a row I'll bet the time keeps getting worse.

The insert time for each rule is, among other things, dependent on the 
number of rules that
must be searched/manipulated, thus an explanation for the times you see.

You should only use --noflush if you really intend to add rules to the 
current  rule set rather
than replace them all.  What are you trying to accomplish here?



