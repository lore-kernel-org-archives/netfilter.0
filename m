From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 15:14:05 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4159C60D.4000602@pbl.ca>
References: <1096400937.3163.134.camel@alkaloid.netup.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096400937.3163.134.camel@alkaloid.netup.ru>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Abylai Ospan wrote:
> Hello, all !
> 
> May be this question in FAQ but I can't find it ;-( I have 3 (or more)
> identical rules in one (for example - INPUT) chain.
> If I do command:
> iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT 
> 
> the first rule is deleted only. Is there any command line option to
> remove all identical rules in one chain ?

No such options.  But nothing prevents you from doing it in loop:

while iptables -D FORWARD insert options here -j ACCEPT 2>/dev/null
do
    : # do nothing
done

Just don't call me script kiddie ;-)

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

