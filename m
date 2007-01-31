From: "Andy B." <globi@hot.lu>
Subject: RE: port forwarding through localhost
Date: Wed, 31 Jan 2007 10:09:58 +0100
Message-ID: <000001c74517$950d2720$0c00000a@susi>
References: <000001c7419d$0bab38f0$0d01a8c0@Mobi>
	<005401c744a8$7a804690$c84f949b@nasw.ds.army.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005401c744a8$7a804690$c84f949b@nasw.ds.army.mil>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Yes, I know that I should have used some FQDN instead of localhost, but the
cirumstances that once were have changed a lot - I will do better next time
:-)

-j REDIRECT is imho just for redirecting towards the same host (localhost to
localhost), so of no use.

As a quick fix, I am now using rinetd which does the trick, but the overhead
is driving the server load up :-/

Andy

-----Original Message-----
From: Michael P. Brininstool [mailto:mikepb@hoplite.org] 
Sent: Tuesday, January 30, 2007 20:54
To: 'Andy B.'; netfilter@lists.netfilter.org
Subject: RE: port forwarding through localhost

I know this is a little late, but when doing services like this, it has
proved helpful in the past to have the customers use a FQDN
(full-qualified-domain-name) instead of an IP.  For example, I setup the
following: imap.domain.com, smtp.domain.com, www.domain.com,
mail.domain.com, mysql.domain.com, proxy.domain.com, ftp.domain.com, etc,
even if they are all on the same machine.  That way, as services need to be
split off onto their own machine, a simple DNS change moves the load.

In the manner of helping in your current situation, isn't there a -j
REDIRECT table?

--
Michael P. Brininstool



