From: Firstname Lastname <forbiddentransition@gmail.com>
Subject: Re: iptables and the owner module
Date: Wed, 28 Mar 2012 12:43:32 -0400
Message-ID: <20120328124332.66e7ad79@gmail.com>
References: <20120327194521.00a33d86@gmail.com>
	<alpine.LNX.2.01.1203280325160.14701@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=odVvgzrSfTVjeLxy86l2zMZpzUglrFy+z8khLIvMuf0=;
        b=eFyigM+6jjo/Q+4UgWursPE4FlcAYiTJy++qJlorqTlTYgvl4eA8RWqf8HJ+imt7fo
         HQ+Y432AvIh8znTGz5lavan6d2T1KIcIOhpPWzXbXsKd5Uf01DiVqsdXwUz1UAYyQJHe
         yDvquUcXQRYVKl8Nt0Xs6pj4NZbizgMFaQSPYZXXNEpK5Ertw0bGzMTGYw+djj/XPgOC
         sOKYc/KbaSjJHeRZpwkgurN9ABQaak5NR8eurNdmdBWcUNQM/SdbmdO/6Exle6+ghoTU
         VvegSKPqavmj9yBgx5pKYqrKaGtvoxFrwXIDEoGD4iCusMwjuECaOmA0G9sruBEOCBfb
         2IbQ==
In-Reply-To: <alpine.LNX.2.01.1203280325160.14701@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wed, 28 Mar 2012 03:32:13 +0200 (CEST)
Jan Engelhardt <jengelh@medozas.de> wrote:

> >-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport
> >--dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner
> >--uid-owner 1000 -j ACCEPT
> >
> >The following log output is generated prior to being dropped:
> >
> >IN= OUT=eth0 SRC=192.168.2.2 DST=173.194.73.103 LEN=60 TOS=0x00
> >PREC=0x00 TTL=40 ID=7363 DF PROTO=TCP SPT=58642 DPT=80 WINDOW=5840
> >RES=0x00 SYN URGP=0 OPT (020405B40402080A1D88900B0000000001030307)
> >UID=1000 GID=1000
> >
> >As indicated in the log output, the packet socket's file structure
> >is owned by userid 1000 and thus should match the preceding
> >configuration line with the ACCEPT target.  
> 
> Not if a preceding match in the same rule returned false. Which is
> what your log line indicates. Seeing it as that, the actual
> ct state is not NEW nor EST.  

If the ct state is not NEW nor EST, then its my understanding that none of the rules should match.

The order through the chain is as stated previously: 

  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --uid-owner 1000 -j ACCEPT
  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j LOG --log-tcp-options --log-ip-options --log-uid --log-level 7
  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j DROP

The 3 rules are nearly equivalent, the difference being the owner module option, --uid-owner vs. --socket-exists (and, of course, the target).
The initial SYN packet to google.com is not matched in the first rule, and thus passed to the second rule where the packet is matched and logged.
The packet is then passed to the third rule and dropped.

Oddly, though, if I add "173.194.73.103 www.google.com" to the hosts file, the intial SYN packet is matched in the first rule and thus accepted.
When google's IP is obtained from a DNS query, the initial SYN packet to google.com is not matched in the first rule, but is matched in the second and third rule.
So far, I've only observed this with google.com (and bing.com).

In any case, thanks for the response.

Bill

