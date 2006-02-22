From: "Bob Sully" <rcs@malibyte.net>
Subject: Re: netfilter Digest, Vol 19, Issue 31
Date: Wed, 22 Feb 2006 15:40:50 -0800 (PST)
Message-ID: <45576.162.119.232.107.1140651650.squirrel@www.malibyte.net>
References: <000001c6388d$a827e990$c05c5a42@fdcp4xq35qslnu>
Reply-To: rcs@malibyte.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c6388d$a827e990$c05c5a42@fdcp4xq35qslnu>
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

Suggestion for the Netfilter admins:


<<>> DiG 9.3.1 <<>> bwdow.com

;; ANSWER SECTION:
bwdow.com.              86400   IN      A       66.90.92.192

/sbin/iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp -s 66.90.92.192 -d
$EXTERNAL_IP -j DROP


deneme@bwdow.com wrote:
> Best Web Designs of World:  http://www.bwdow.com

-- 
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net
http://www.malibyte.com


