From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: I want to connect a PC from Internet to my LAN (Asterisk server)
Date: Mon, 21 Sep 2009 10:10:52 +0100
Message-ID: <56378e320909210210l67258b86pb7341acb4c6a4cb6@mail.gmail.com>
References: <4AB6A1EE.1040201@gmail.com>
	 <4AB6A375.2070801@standarduniversal.com.au>
	 <4AB6AA79.3090302@gmail.com>
	 <4ab6b447.151bf30a.1393.ffffc3ea@mx.google.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type;
        bh=f65ksPdBUkXHMDvYczdilw+EdeXe332UuG00ZFduHFI=;
        b=jTAJrh0k6P8QHxsd3HmMXinW4Syb5mIlc2v+EOHCH3DBGACDu93vrlUqBUIr/cn/My
         7+o/7nLki7RKi+y28oPWMBBKeYDm97jzqR9Hkhly4RDnwXYxEVoSsNNvSLWA54TFHF6M
         lkl3rs6XqqJpYTaPoBSW/f04QnnPjz26LwE5s=
In-Reply-To: <4ab6b447.151bf30a.1393.ffffc3ea@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

2009/9/21 Juan Cardoza <ing.jcardoza@gmail.com>:
> Hello I am been looking in the internet but no one option have worked.
> I want to connect my xlite softphone through the firewall that have an specific IP (xx.xx.xx.xx), the firewall is reached from the internet, I can connect to the firewall via tridia without any problem.
>

Assuming the softphone can route traffic to the pbx (or atleast to the
firewall which can then reach the pbx) have a look at using the SNAT
features to change the xx address to the firewall's address (assuming
you need nat)- as SNAT does stateful tracking replies should get
translated back to the correct address. As I rarely need to use SNAT
I'll leave finding the correct options to you (my brain is suffering
lack of coffee).

If you don't need NAT then just add the appropriate rules (probably
along the lines of the following assuming you have multiport matching)
iptables -t FORWARD -s xx.xx.xx.xx -d yy.yy.yy.yy -m mport --dports
<port list> -j ACCEPT

iptables -t FORWARD -d xx.xx.xx.xx -s yy.yy.yy.yy -m mport --dports
<port list> -j ACCEPT



-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
