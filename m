From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: ipporthash, ipportiphash, ipportnethash problems
Date: Thu, 30 Sep 2010 23:03:07 +0100
Message-ID: <4CA5091B.1090200@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=6xLBS/avpAu2j64ywnWnVcnCfZcwNI1dPDh4rlW8ejI=;
        b=sg+bbEARGAQ0Gk/zOv7m3GigX3irni609angZ6SEyPdJgtj64uD0CToqRI5U5LCWMX
         j460Sedm72yPTpPYpHrfnmiMMTe0Za6j+OqxKTbrzXrMyJ0aA0qr3fBi4roOGH+IGsQk
         sUh5AY75WzlAbwkeCtXr4iPz9DVdUA95pUKvo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am not able to get *any* matches when I have the following combinations:

1. ipporthash: x.x.x.x,y [src,dst] or [dst,src] (i.e. source IP address 
and destination port and vice versa);
2. ipportiphash: x.x.x.x,y,z.z.z.z [src,dst,dst] or [dst,src,src] (i.e. 
source IP address, destination port and destination IP address and vice 
versa);
3. ipportnethash x.x.x.x,y,z.z.z.z/c [src,dst,dst] or [dst,src,src] 
(i.e. source IP address, destination port and destination subnet and 
vice versa);

When I split up the above sets like:

For case 1: match-set single-set src match-set single-port dst (and vice 
versa with src and dst reversed) - all in one line - i.e. creating two 
separate sets containing the appropriate src IP address and and dst 
ports respectively;
For case 2: match-set single-set src match-set double-set dst,dst (and 
vice versa with src and dst reversed) - all in one line - i.e. creating 
two separate sets containing the appropriate src IP address and another 
set containing the destination IP addresses *and* ports respectively;
For case 3: match-set single-set src match-set double-net-set dst,dst 
(and vice versa with src and dst reversed) - all in one line - i.e. 
creating two separate sets containing the appropriate src IP address and 
another set containing the destination IP subnet addresses *and* ports 
respectively;

I was able to get a match! This leads me to believe that either xtables 
has a bug and can't handle mixed src,dst designations in the same set, 
or, I am doing something wrong. Which is it?

