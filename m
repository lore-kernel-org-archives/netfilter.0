From: "Christian S. Perone" <christian.perone@gmail.com>
Subject: ip6tables HL bug ?
Date: Mon, 20 Jun 2011 15:47:30 -0300
Message-ID: <BANLkTi=W1uCCMceOT64RMXyK-Q7fFGgmSA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=/6kWa44W48fx99fML2dLLtN6jQgoRYtZ2b2KILCAqFg=;
        b=u4KUHxSlj2kxU4DD/MKk873f0ZOvY3sCDMFi9klnI3U7BA7tJ1ZQvNTG/DFpviwAkE
         I79VPOk4nEkY+GHe+hRt2rLZR4nqgyM47iX3U24CjgwOtbU6tOgfpa5DFyhOYEPqhufe
         de5G1z71P53ZM+UZPYKhO0bdfgiLlqA0vxEbA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Does someone knows why is ip6tables showing this error:

# ip6tables -t mangle -A POSTROUTING -j HL --hl-inc 1
ip6tables v1.3.5: HL: increasing by 0?

If I use the hl-set with 2 as argument for instance:
# ip6tables -t mangle -A POSTROUTING -o eth0 -p icmpv6 --icmpv6-type
router-advertisement -j HL --hl-set 2
# ipt6tables -t mangle -L
(...)
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
HL         ipv6-icmp    anywhere             anywhere
ipv6-icmp router-advertisement HL set to 0

See that the value read is always interpreted as "zero", in
libip6t_HL.c we have:
if (value == 0)
{
   exit_error(PARAMETER_PROBLEM,"HL: increasing by 0?");
}

So the problem is only thrown when the value is zero, the question is,
why is ip6tables reading the argument as zero ?
Does someone knows if this is a known bug ?

Details:
Kernel 2.6.17, powerpc
ip6tables v1.3.5

Thank you !

-- 
"Forgive, O Lord, my little jokes on Thee, and I'll forgive Thy great
big joke on me."
http://pyevolve.sourceforge.net/wordpress/
