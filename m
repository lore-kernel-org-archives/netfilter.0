From: Angel Motta <angelmotta@gmail.com>
Subject: Rules PREROUTING doesn't work
Date: Tue, 16 Mar 2010 22:27:43 -0500
Message-ID: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=3LfV5mLlG9Fx+H8n9LoP56vh7TuDsv4SfJ1xkkURaYk=;
        b=jO/Ts6xIqmwdTK37Z6YR39EeeBT7HMjcAf5OKH8S3m5UfzcKvGdR4TU/1OKtjoYAq+
         m1dm8PjSkHW7PcORDUeYKsrsMZ9iYVzLk8/jVdzDf3ed+vkA+Fk8H258xuhsHo0MyOyO
         ydbuNLLmhdi+cZf3CqctyHMKyHdE1xBTWTyaQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi List
This is my first time the I write to this list. I have a problem case
with rules PREROUTING.
I am creating a rule PREROUTING from a range of port which request
openvpn client and the problem is that when I apply this rules and
only rules NATs are runing (PREROUTING and POSTROUTING the output of
#> iptables -L is blank) the clients openvpn still conect to the
Firewall and not to the SERVERVPN, all requests are processed for
firewall.

this is the rule:
$IPT -t nat -A PREROUTING  -i $IF_EXT -d $TESTVPN -p udp --dport
5000:6000 -j DNAT --to-destination $IP_DMZ_SERVERVPN

Note:
Where IPT is the bin of iptables, $IF_EXT es my external interface,
TESTVPN is a public IP and IP_DMZ_SERVERVPN es my new openvpnserver.

Some tips for this rare case?
I am using Centos 5.4 in my firewall.

Thanks for your assistance.
-- 
Atte
Angel Motta Paz
