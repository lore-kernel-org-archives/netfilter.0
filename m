From: Eric Leblond <eric@inl.fr>
Subject: Re: Understanding how nat works
Date: Tue, 21 Sep 2004 16:15:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095776129.3572.1.camel@coati>
References: <20040921140258.75515.qmail@web51307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040921140258.75515.qmail@web51307.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Dominic Iadicicco <sctylib2004@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-09-21 at 16:02, Dominic Iadicicco wrote:
> "iptables -t nat -A POSTROUTING -s 172.16.12.131 -o
> eth0 -j SNAT --to 172.16.12.167"

so when packet leave your computer they came from 172.16.12.167 ?
This is not an IP of your computer, it can not receive the answer.
-- 
Eric Leblond <eric@inl.fr>
INL


