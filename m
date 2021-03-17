From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 15:07:55 -0400
Message-ID: <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia> <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UamCpShMpF4A8snoZF1sPYVtyocYCIUuMfCOsAvYJvk=;
        b=I9zmmQhpOkb+ZYCeeSMqGjdk3aKn2xtJjEOl45uJDKa2DBi8q9nq9cLBDwX5+M3kTY
         1F8rQ9uiyBP63DOvnmLrrjvPSWZyWfB5RCRvDBJZnT/GdxToZDmd+GmjIFPuI6oXhvmX
         7H6IavDs16y9SKHkAlX9VXILdf7QIXQZ7MGRoGP9y7GS10W4RLXGxsPC12Rs8oGB5o74
         gsFEBFagkT8yr9Z/EkIV+jMwglw1ZiAP0ciKIX6a04GqAdpzhJt8SiDaJhfXasgcU1gr
         hgJijprojlozI4SyBmM0Epgm5jZB23fBl/eRcSTYsI0e7NyCFHt1CfosdFGA0moiQqaT
         ZDvA==
In-Reply-To: <20210317103443.GA18462@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> Set on the counter flags at flowtable creation time, ie. flowtable 'f'
> should not exist.

I tried creating a file like this:

    delete flowtable inet filter f

    table inet filter {

        flowtable f {
            hook ingress priority filter - 1
            devices = { tun0, bond0, dummy0, bond1.999, bond1,
vrf-conntrackd, vrf-mgmt, enp66s0f1, enp66s0f0, enp5s0f1, enp5s0f0,
eno4, eno3, eno2, eno1 }
            counter
        }
    }

And then running nft -f <filename> on it, but I got these errors:

    <filename>:1:30-30: Error: Could not process rule: Device or resource busy
    delete flowtable inet filter f

I assume this is because the flowtable is in use, so it can not be deleted.

Short of rebooting the Linux server (which I cannot do right now since
I have many people relying on it), is there any kind of way for me to
re-create the flowtable with the added 'counter' parameter without
impacting traffic?

Thanks,
-Martin
