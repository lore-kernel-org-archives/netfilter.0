From: Martijn Lievaart <m@rtij.nl>
Subject: Re: blocking all connections
Date: Fri, 06 Apr 2007 18:13:18 +0200
Message-ID: <4616719E.8050306@rtij.nl>
References: <20070406091639.ganfslae8ks4wcsk@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070406091639.ganfslae8ks4wcsk@webmail.harrisonburg.k12.va.us>
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
To: dhottinger@harrisonburg.k12.va.us
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

dhottinger@harrisonburg.k12.va.us wrote:
> What is the best rule for blocking all connections to an ip address.  
> For example, lets say I want to block all connections to the domain 
> google.com.

The domain google.com is not an ip address. If you want to block all web 
access to google, use a transparent cache. Otherwise I see no way to do 
this (reliably).

M4


