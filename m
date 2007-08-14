From: "pankaj jain" <jainp1979@gmail.com>
Subject: not [!] rule is not working
Date: Tue, 14 Aug 2007 12:15:42 +0530
Message-ID: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=tVfNBQoDDa+r9sNzhr/NJrNkKy25kj6UGdhRc+F4lQMPeTviPT12vd2YrjjJpx703NfYBzOCSLyKd5+kf+76634wilRN5bSl4VTYoy+Vrm7w567spvZKID26yYgYasP/d7Ia/jUZr8KXpCozIGwQHFdHDTYHYIGO/nkU6P7ygXg=
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I was trying to drop arp packets such that only specific interface
should answer the arp requests.
I added following rules in input chain.
-j DROP -i !eth1 -o * -d 10.19.1.102 --opcode 1 , pcnt=0 -- bcnt=0
-j DROP -i !eth2 -o * -d 10.19.51.102 --opcode 1 , pcnt=0 -- bcnt=0

as packet count suggests these are not matching against any packet.
when I do arping from other machine to the 10.19.1.102 (assigned to
the eth1 interface)
arp requests are responded from eth0 (ip-10.19.0.102).
why the rules are not having any effect.

-- 
Thanks
Pankaj Jain

