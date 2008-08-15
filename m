From: Jan Klod <janklodvan@gmail.com>
Subject: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Fri, 15 Aug 2008 12:55:44 +0300
Message-ID: <200808151255.44987.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=X3RNZgeMEd9Z4IUGR9vWcKGYt39gj602vmlIvqgIV7U=;
        b=ER/ex7zErIW/iI8921rm36PgBRJglrJtOI3AavOK5i2j1jEo3cPqlldsCIgTU9NYaw
         +rvbG2+QZyxs/vNGoy41XlG7q2g63EvwDqPxTBiM2epERv3lyrJHgjc0lCSTjNF2WPNW
         8A5OgHBN/JfWeHKukDst+W2EVhPmZa00YtbQ0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

There is one thing really troubling me for fourth day and I hope, this is the 
right place to ask for advices: 
I have VPN access through LAN NIC, I managed to log in the VPN server and, 
using ping -I ppp0 some.host.domain got an answer. Nothing more this far, but 
the initial goal was simply to grant an user access to VPN as toppic subject 
describes. Just like I would have started firefox -I ppp0!
(all user's traffic through ppp0, while other users can still go through 
eth1!)

Also this created an extra question: how web browser "knows", which interface 
should be used, if there are multiple?

I would greatly appreciate your help here, since my efforts following 
http://gentoo-wiki.com/HOWTO_PPTP_VPN_client_(Microsoft-compatible_with_mppe)
http://www.wlug.org.nz/SourceBasedRouting
http://lartc.org/lartc.pdf
just didn't succeed somehow. 

Hope, you know,
Jan
