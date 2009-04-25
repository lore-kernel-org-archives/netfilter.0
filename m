From: "Paddie O'Brien" <paddieobrien@gmail.com>
Subject: Dynamic IP address in a rule?
Date: Sat, 25 Apr 2009 13:12:37 +0100
Message-ID: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=aWk9lEAE0QJ/FWTnnkrKPFJPyeblYkEfnEGJU4QOe6M=;
        b=RnjparD+XBa42cLN7tj6zW/HRl8SkjS6FzfohASzQMXJssROLuo2IBlNVkD+cWj2mk
         nAz7WdnKwIOS7ehLtR+ShpN4zJLrIcEw9fLW2olIBWBkjKP7+eOMRMxUr7oXV/omjwJ6
         FzyEzhp169yUJOfvFBiKB6cergSVgc8cllFx8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

My IP is dynamically assigned and I want a rule like this one:

iptables -I INPUT 1 -d my_ip_address  -m state --state NEW -j ULOG

Can a rule work out the IP address of its host?

Thanks,
P
