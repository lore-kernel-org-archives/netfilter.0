From: Payal Rathod <payal-netfilter@staticky.com>
Subject: Re: changing rules at a defined time
Date: Wed, 24 Dec 2003 18:56:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031224132604.GA1942@linux.local>
References: <20031224092936.GB27890@staticky.com> <200312241011.14770.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312241011.14770.Antony@Soft-Solutions.co.uk>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,

Thanks for the mails all of you. I am also going to look into
patch-o-matic later. I have a couple of doubts now.

On Wed, Dec 24, 2003 at 10:11:14AM +0000, Antony Stone wrote:
> I really disapprove of a default ACCEPT policy on FORWARD.

Why? I can DROP everything later.

> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
[...]

> Then at 16:00, use a cron rule to run:
> 
> iptables -A FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT

Should that be iptables -I or specifically -A?

> At 17:00 use a cron rule to run:
> 
> iptables -D FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT
> 
> The only thing I can think of which this solution which you have to decide 
> whether you're happy about is that connections currently in progress at 17:00 
> will not be cut off - users simply won't be able to make new ones until 16:00 
> the following day.

You mean a person logged on to MSN can continue being logged on
throughout?
So, do I FLUSH the rules through cron to prevent this?

With warm regards,
-Payal


