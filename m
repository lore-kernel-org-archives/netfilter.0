From: FiloSottile <filosottile.wiki@gmail.com>
Subject: Iptables without ipt_state using xt_state
Date: Tue, 12 Jan 2010 18:34:21 +0100
Message-ID: <4B4CB29D.9000506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type
         :content-transfer-encoding;
        bh=LfW9KvlM7g9zRbzOFeWZxzfx4yv1ddwS4WA2gzMtiiE=;
        b=SuSTlFBqh4QisI+VojafZI8F2o54mYWBhwouF1XOzHSDRwELqN8ti0YpO0gAgtDm/C
         GQjndwFiInyHBmnDhaBnUWNcf+GY3v7vjZb3rpv+lnrmjW4mrjaFSmQ9LifcwmRYUUBV
         lRoXClD0quvPMUoTkEJHnQdMbxymOZlNqcJOo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am running on a OpenVZ box with static unmodifiable kernel.
I have no ipt_state and ipt_connmark but i have xt_state and xt_connmark.
I want to build a simple firewall, but when i run that:

# iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables: No chain/target/match by that name

How to use xt_state instead ipt_state? Or there is an alternative way to
build firewall?
Thank you

-- 
Filippo Valsorda                             FiloSottile@WikiMedia
PADI Rescue Diver #0907EL9205    DAN ADV O2 Provider + BLS #281664
www.filosottile.info                      GPG 01A82A13@pgp.mit.edu
Key fingerprint 94B6 85B2 AE48 1C47 BD4D  DC5B 16F3 ADA6 01A8 2A13

