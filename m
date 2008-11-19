From: "JC Janos" <jcjanos245@gmail.com>
Subject: When is ipset's "resize 0" used?
Date: Tue, 18 Nov 2008 20:34:18 -0800
Message-ID: <7259d7020811182034m16f47786rcb0e0805767b05ca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=xXpAqT7kz+mSOJQr+cyiyJHnJ3Ls172Zg+jC84j7734=;
        b=iQYj9tHHip28GDlYKO3/Kp5kyK/8ss9F2JscSo3T8/5efnCGJPMaGX3XDVsaj6fLUG
         8OorD7C5Zoe4hPSfJz5FFJM+Ph8VpyrTAqty2j3IU11eKPF2CmLXB8xqZLmmJjKWOl/L
         KX688I7QNSRaGyiaKzl4QncGOUXl7GLne/Yks=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

From the ipset "tips & examples" ,

  If you want a fixed size iphash type of set, then define it with
zero valued resize parameter:
  ipset -N foo iphash --resize 0

Would this be used for a constant/unchanging ipset, e.g. containing 25
IPs that won't be addded to or changed dynamically?  Similar to
OpenBSD's pf "const" table construct,

  table <XXX> const { ip1, ip2, ..., ipN }

?

Also, Does hashsize literally correspond to # of entries?  So, 25
entries would need only hashsize=25?

Thanks.

--JC
