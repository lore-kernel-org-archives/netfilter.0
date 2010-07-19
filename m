From: Richard Knight <rjknight@us.ibm.com>
Subject: question about esp and policy matching rule
Date: Sun, 18 Jul 2010 22:29:42 -0500
Message-ID: <OFC79F2599.5D7A2E5E-ON85257765.0011E584-86257765.0013332D@us.ibm.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Hello,

 I don't fully understand the two rules below.

Since each of the rules are get inserted at position 1 in the table the ESP
rule ends up below the policy matching rule, will the ESP rule ever be
checked?

# allow all ipsec traffic into and out
$IP6_TABLES -I INPUT  1 -i $EXIF -p esp -j ACCEPT
$IP6_TABLES -I OUTPUT 1 -o $EXIF -p esp -j ACCEPT
$IP6_TABLES -I INPUT  1 -i $EXIF -m policy --dir in  --pol ipsec  -j ACCEPT
$IP6_TABLES -I OUTPUT 1 -o $EXIF -m policy --dir out --pol ipsec  -j ACCEPT

I have an application which does not seem to operate through my ipsec
tunnel without both rules in place, I'm having trouble figuring out why.


Thank you in advance.

Jamie Knight (rjknight@us.ibm.com)
IBM Power Firmware Development
(512) 286-7017 (t/l 386-7017)
office 045/2A-01
IBM Austin, TX

