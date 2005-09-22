From: Subramanian <sub1779@yahoo.com>
Subject: difference between syn and NEW
Date: Thu, 22 Sep 2005 05:39:49 -0700 (PDT)
Message-ID: <20050922123949.42309.qmail@web30803.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi,

I read in the iptables manual [in the Appendix B.
Common problems and questions ]that the NEW state
match may accept any packet marked as NEW whether it
has syn bit set or not.

 it says "If you use state NEW, packets with the SYN
bit unset will get through your firewall"

so in short it means anything marked NEW is passed
thru irrespective of whether syn is set or not OR
maybe any other bit is set

My question is if i am having a single firewall with
deny all policy and wanting to accept only new
connections for ip's or services like ssh,smtp etc
what shld be my rule -

a) iptables with --syn   OR
b) iptables with --syn + NEW OR ONLY
c) iptables with NEW

what is the recommended rule for a restrictive
firewall?

I guess option a) is the best one. But it shld not
lead to a lot of connection drops as NEW allows timed
out connections if the connection is not closed.

Please suggest the best practice.

Secondly if i want to limit ssh connections for syn
flood protection what is the recomended limit and
limit-burst values.

thirdly if i want to limit ping for ping flood
protection what is the recomended limit and
limit-burst values.

Please suggest the best practice.

Thanks & Regards,
sub  

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

