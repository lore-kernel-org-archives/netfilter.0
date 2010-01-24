From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Can iptables filter WiFi Clients?
Date: Sun, 24 Jan 2010 19:19:04 +0000
Message-ID: <ac5c74141001241119h1c6fe806q69da33f3671426b7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=rGtstoxG1THS5Kx60gvmhCxxDoxJMjy6kg1ZmcdRSuk=;
        b=QaiISs+XEG4JALx+ILMAY5rzQFrydlPXDYaa06/AIk4RJZj+ZHqxKT3U22yQybRidk
         AYsvcOeGT9dFmgFVRBzy9CLEKae2t8dPo+Jb2PwyCMU9snPCpwkAwq/FiRtrte2zt01D
         9FnmFFIxqXI4QgVVSjDcKhi6bnQ9NP0Xbn3TQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Experts.

I was wondering if iptables particularly the filter table can filter
MAC addresses regarding verification of WiFi clients?

I see that on my home router hosting the DD-WRT firmware, that I can
control access via the GUI to the network, for example, by both WPA
and MAC filtering.

I was just wondering if under the hood that the MAC filtering is
really a set of iptables rules.

If anyone has any insights as to how iptables can be used to filter
WiFi scenarios , please let me know.
