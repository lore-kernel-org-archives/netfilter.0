From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: Re: HELP : How to group IP addresses by refering to them as a single name ?
Date: Thu, 19 Sep 2002 15:07:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020919150734.51d3c1d4.arc_of_descent@gmx.net>
References: <200209041320.g84DKjv31137@vulcan.rissington.net>
	<20020919074555.18679.qmail@web40202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020919074555.18679.qmail@web40202.mail.yahoo.com>
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

Alok Shukla <alokshukla@yahoo.com> thus wrote:

> iptables -t nat -D POSTROUTING -s 192.168.0.11-50  -d
> any/0 -J MASQUERADE

Well, I don't think the above option is available
with the current version of iptables
Why don't u create subnets.

for eg. for 8 ips from 192.168.0.0 - 192.168.0.7
u can use "-s 192.168.0.7/29"

similarly for 192.168.0.8 - 192.168.0.15
u can use "-s 192.168.0.15/29"

Just a suggestion :-)
Might not be the most appropriate

But, i would normally create some shell or perl
scripts to manipulate the ips

--
arc_of_descent

