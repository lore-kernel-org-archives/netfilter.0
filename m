From: "patrick daures" <patrick.daures@gmail.com>
Subject: special SNAT and DNAT gateway
Date: Thu, 13 Nov 2008 15:58:12 +0100
Message-ID: <5ed0ca650811130658s3d0b99aejadd956d3b4899487@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=3bWRPefnLNEXT+tHdRL8atOqAhJKqyfdxDEVcWKF1O0=;
        b=a+8iptvWL/u21lkHbfDz4SnT1/S89qFtTB51ktS8kkcbU9Gxbc51Sr8NbDCdG5uFwo
         8ayPHVdrzVLu2uXM5+DdfQCpgxR28yH0xCtrZrXEwUHne1ZTZIo1IFExNKB9ZcaawEa1
         6phlUoMfods5jbhPWyGqb/7zIGLOiAIFPVgXU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
I would like to create a gateway in order to do a special kind of NAT.
I need to do SNAT and DNAT in this way :

SNAT :
@src A.X.Y.Z -> A+1.X.Y.Z
Example:
@src 192.168.0.1 -> 193.168.9.1
@src 191.23.33 -> 192.23.33

DNAT :
@dst A.X.Y.Z -> A+1.X.Y.Z
Example:
@dst 168.1.0.1 -> 169.1.0.1
@dst 154.9.2.36> 155.9.2.36

I know how to do it with "static list" of @IP with iptables :
DNAT :
iptables -t nat -A PREROUTING -d 192.168.0.1  -j DNAT --to-destination
 193.168.0.1
SNAT
iptables -t nat -A POSTOUTING -s 168.1.0.1  -j DNAT --to-destination  169.1.0.1

But, as I have a large number of @IP, how can I do it for ALL ip addresses ?

Thank you for giving few secondes to explain me how to do it if you
have an answer.
Thank you !
