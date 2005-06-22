From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: Re: IBM Dispatcher X iptables AND linux advanced routing
Date: Wed, 22 Jun 2005 14:33:23 -0300
Message-ID: <007f01c57750$7d9a4b40$5100a8c0@14bis>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi Seferovic, thanks for answering.


>Though LDAP is not same as the RADIUS, but I can imagine that is able to
>write a daemon ( on the balancer box ) that allows connections. And this
>same daemon should be able to forward the queries to the real servers ( of
>course the one that are alive ). It also should be able to know which
>servers are alive and which not...

Ok, but my question is not only about LDAP. The IBM Dispatcher is multipurpose, 
so I'm looking for a multipurpose solution, if exists, based on iptables + 
advanced routing.

To write a daemon for this is not what I looking for right now.

Regards,
bnegrao 


