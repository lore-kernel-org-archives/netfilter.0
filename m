From: "Mohammad Norouzi" <mnrz57@gmail.com>
Subject: Re: REJECT doesnt work
Date: Tue, 19 Jun 2007 16:16:23 +0330
Message-ID: <34b8543c0706190546o21265b55i98f3bb0cfd87cad1@mail.gmail.com>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
	<01c501c7b236$54be1530$0b0ffe0a@NS006819>
	<34b8543c0706190127h41d80c97yec8606b03f72a7f1@mail.gmail.com>
	<003001c7b256$dd268810$0b0ffe0a@NS006819>
	<34b8543c0706190321w4fcd43e7yfa6a4a1308def5f9@mail.gmail.com>
	<003601c7b26c$c1d25e70$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=uT7HZ6ocd8PjPpl0lr+To9+W1e06aZZU4Ah2xQXzP6dtgep3EwojUqimdSbLFQurQEWEW3W2PCwwsK9OXft0+MumE4KrRMo/UdfNzOaZlMYEWEje/Fjwgs96QFknyg5ReMH9bgOfh+60hmF+v/D9JVZDPwpGkA0/G0UTTQP++68=
In-Reply-To: <003601c7b26c$c1d25e70$0b0ffe0a@NS006819>
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
Cc: netfilter@lists.netfilter.org

Thanks Rob
it seems it's not loaded, check this:

#locate ipt_REJECT
ipt_MASQUERADE          3649  8
ipt_mac                 1985  7
iptable_nat            23173  2 ipt_MASQUERADE
ip_conntrack           40949  2 ipt_MASQUERADE,iptable_nat
ip_tables              16833  3 ipt_MASQUERADE,ipt_mac,iptable_nat

and
# lsmod|grep ipt
ipt_MASQUERADE          3649  8
ipt_mac                 1985  7
iptable_nat            23173  2 ipt_MASQUERADE
ip_conntrack           40949  2 ipt_MASQUERADE,iptable_nat
ip_tables              16833  3 ipt_MASQUERADE,ipt_mac,iptable_nat

how can I load the ipt_REJECT?



-- 
Regards,
Mohammad
--------------------------
see my blog: http://brainable.blogspot.com/
another in Persian: http://fekre-motefavet.blogspot.com/

