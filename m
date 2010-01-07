From: MargoAndTodd <margoandtodd@gmail.com>
Subject: passive mode ftp high ports driving me nuts
Date: Thu, 07 Jan 2010 11:13:02 -0800
Message-ID: <4B46323E.1050106@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=IbIoyLKAgj0xkILkdKXWUj55gPksMJzOEaYKkCBmOS8=;
        b=q+pDMW23+fesrvpyJfKsHD0LMwYMMGAiXo2h3k/Qs+CQFZPiEkYSio729biXjt1Vkp
         8cp7xwpok3bJBY8YTVP6glQ/JzdlJemWS+t4dqipbcJzSWcw76lKQLr0tVdiLZoORs2q
         tPc1ag5D7JCCsIPKuzQ2tPaNAsy5moFFS55aY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

In my firewall, I deny all and then allow what
services though that I want.  Problem: on
passive mode ftp, where the second connection is
estabilshed using random high ports, other
services are using my (last three) ftp rules.

My passive mode rules:

/etc/sysconfig/iptables-config:
IPTABLES_MODULES="ip_conntrack_netbios_ns ip_nat_ftp ip_conntrack_ftp 
ip_conntrack_tftp"

unassgn=1024:65535
$tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn 
--dport ftp         -m state --state NEW,ESTABLISHED           -j ACCEPT

$tbls -A dsl-in   -i eth1  -p tcp  ! --syn --sport ftp -d $eth1_addr 
--dport $unassgn -m state --state RELATED,ESTABLISHED       -j ACCEPT

$tbls -A dsl-for  -i eth1  -p tcp  ! --syn --sport ftp -d $internal_net 
  --dport $unassgn  -m state --state RELATED,ESTABLISHED  -j ACCEPT

# The "ftpdata" session is a "new" one when it sends the SYN.  However, 
the ftp_conntrack module marks it as related to its controlling
# ftp session, so that state=related matches.  This should deny any 
"ftpdata" session that doesn't have a controlling ftp session.

$tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn -d 
$ANY_IP --dport $unassgn -m state --state RELATED,ESTABLISHED 
      -j ACCEPT

$tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn 
-d $eth1_addr --dport $unassgn  -m state --state RELATED,ESTABLISHED 
   -j ACCEPT

$tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn 
-d $internal_net --dport $unassgn   -m state --state RELATED,ESTABLISHED 
  -j ACCEPT


It is the "--sport $unassgn --dport $unassgn" that is killing me.
How do I restrict the last three to just passive mode ftp?

Also, what is the lowest port that the random passive mode ftp
port will choose?  20,000?  That may be all I need to do.

Many thanks,
-T
