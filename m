From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 10:15:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C72985.6010405@pbl.ca>
References: <20040609081453.75751.qmail@web14704.mail.yahoo.com> <40C728C3.8080406@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C728C3.8080406@pbl.ca>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

Aleksandar Milivojevic wrote:
>    -A OUTPUT -p icmp --icmp-type ping --state NEW -j ACCEPT

Hm, typo (in two places), should read:

    -A OUTPUT -p icmp --icmp-type ping -m state --state NEW -j ACCEPT

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

