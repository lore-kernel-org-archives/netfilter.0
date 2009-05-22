From: Stefano <stefano1981@gmail.com>
Subject: Ebtables NAT (OUTPUT)
Date: Fri, 22 May 2009 19:49:28 +0100
Message-ID: <c60ab7b20905221149g43c71dfbk9246cb2c0e6a2be2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=Z5uhAirNMymHRP4UfULonFINLqRvaL9fRAD2aXwbdeQ=;
        b=ATbhdTcthxwqaMR1apwrgEycy0HUGVkS3C6FaaJFnAs/FjPylKm+V5GywcYu3DXbqx
         4iV1i8uTxyG++X5Jx1vYTnWaljFCvk/Q+6QUpzrOWvtLuc9EYKrGA9xThOl5iPJ/k3Ch
         m9J8W3JQRpzzfxm4JzJPmZPdmjsc8UWykglLs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everybody,

I read in the tutorial "ebtables/iptables interaction on a Linux-based
bridge" --> http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.htm
that the nat OUTPUT chain is traversed after the bridging decision
which is too late and the intention was to change this behavior. I'd
like to know
if in the last version of ebtables this has been modified.

Cheers,

Stefano
