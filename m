From: MargoAndTodd <margoandtodd@gmail.com>
Subject: Re: passive mode ftp high ports driving me nuts
Date: Fri, 08 Jan 2010 18:59:41 -0800
Message-ID: <4B47F11D.1000507@gmail.com>
References: <4B46323E.1050106@gmail.com> <4B4707EA.9010301@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=Uo65aCcM+U5t/481Ybt79bdumD22hDPR8jD/ooAokQA=;
        b=t+USznM9yrAA9qmw07RgHWA+jcCU+PZdc1qbXx3qg636ghuRC4cgUGzOlsWmc0NMiG
         NQYvdNCT7h+7yfK40rzo1xD2jrdukKxEdY4amddwHDQbeIPqXmU5WOnDw5xsM7Ku7cKl
         2CIWAMduq31A35oLQL8tkgGwq5rZO8Aft+sAQ=
In-Reply-To: <4B4707EA.9010301@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 01/08/2010 02:24 AM, Mart Frauenlob wrote:

>> It is the "--sport $unassgn --dport $unassgn" that is killing me.
>> How do I restrict the last three to just passive mode ftp?
>>
>
> use the 'helper' match extension. i.e: -m helper --helper ftp.
> if you need to distinguish between active and passive, you still can use
> the port and state matches for that.

Hi Mart,

Works perfectly.  Thank you!

-T

p.s. my new rules:

# ftp passive mode (browser) stuff.  Note: ftp_conntrack module is 
required, e.g.:
# /etc/sysconfig/iptables-config:
# IPTABLES_MODULES="ip_conntrack_ftp"
#
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
#$tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr --sport $unassgn -d 
$ANY_IP --dport $unassgn -m state --state RELATED,ESTABLISHED 
      -j ACCEPT
#$tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn 
-d $eth1_addr --dport $unassgn  -m state --state RELATED,ESTABLISHED 
   -j ACCEPT
#$tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP --sport $unassgn 
-d $internal_net --dport $unassgn   -m state --state RELATED,ESTABLISHED 
  -j ACCEPT
$tbls -A dsl-out  -o eth1  -p tcp  -s $eth1_addr       -d $ANY_IP 
-m helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT
$tbls -A dsl-in   -i eth1  -p tcp  ! --syn  -s $ANY_IP -d $eth1_addr 
-m helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT
$tbls -A dsl-for  -i eth1  -p tcp  ! --syn  -s $ANY_IP -d $internal_net 
-m helper --helper ftp -m state --state RELATED,ESTABLISHED  -j ACCEPT


