From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: source and destination rule
Date: Wed, 23 Apr 2003 11:57:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304231157.56421.heinrici76@gmx.de>
References: <35903.196.35.22.18.1050914530.squirrel@www.nobarrier.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <35903.196.35.22.18.1050914530.squirrel@www.nobarrier.co.za>
Content-Disposition: inline
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

Hi

On Monday 21 April 2003 10:42, Jonathan wrote:
...
> this is the rule i have tried
>
> $IPTAB -A FORWARD -p tcp --dport 22 -i eth1 -s 192.168.1.0/24 -d
> 192.168.45.0/24 -syn -m state --state NEW -j ACCEPT

Isn't "-syn" or "--syn" and "state NEW" the same ??

Axel

