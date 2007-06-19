From: "Mohammad Norouzi" <mnrz57@gmail.com>
Subject: REJECT doesnt work
Date: Tue, 19 Jun 2007 08:52:33 +0330
Message-ID: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=LrSIu4BC+3z0UU6MBnGkNgKoKXc6h7SzJNKuMBbEiNpVOlXqucywMWyq530t5rslltzjirOw5WjKhtPpGjOTKuCMGbg5jRCWePbvwSqeIm2IgESKsA7KEJmYE6R8vk4pnPHkOYYep8mXwfHQ+dnSSCpEERuUZKUNiLHrYkPzHNA=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi All
I have following line to drop any request that is not from the
original computer and it works fine
-A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
00:11:2F:29:96:84  -j DROP

but now I want to change it to REJECT but it doesnt work and iptables will fail

-A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
00:11:2F:29:96:84  -j REJECT --reject-with=icmp-host-pro
hibited

what is the problem?

thanks
-- 
Regards,
Mohammad
--------------------------
see my blog: http://brainable.blogspot.com/
another in Persian: http://fekre-motefavet.blogspot.com/

