From: Gergely Buday <gbuday@gmail.com>
Subject: newbie question
Date: Thu, 30 Jul 2009 20:03:51 +0200
Message-ID: <90d975d30907301103n391ef332mf0d299eacf884af7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=2Jmvk+UdihylBapIQYg6XTDpwbY5xG0MZhLVziygnjU=;
        b=LDMHSz+QcylZaku8eaCfLY60JFZu+gAibdpiikav8FIdgJ2YYIyFVgdcqryb2c3e/H
         jV9hQfpAFRq6L26ssCQFnbydPgCVJkTRvB8FVV3lfksPARQ0JeRnCu0eeqdwk8tjX1y2
         y6/zOA+X2rgPjM/aAo7q4zHne3vnRXIgimRwA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear All,

I have a basic question: I need to enable a cvs server to telnet back
to port 2401 as described at

http://forums.fedoraforum.org/archive/index.php/t-37342.html

---
> $ cvs login
> Logging in to :pserver:rob@<hostname>:2401/home/repository
> CVS password:
> cvs [login aborted]: connect to <hostname>(<IP address>):2401
> failed: No route to host
>
> i've verified that the network is up, that i can ssh into the
> server, that xinetd is running, that cvspserver is on, that the
> CVS repo is unchanged from what it was before the re-install,
> etc. i'm not sure what else i might be checking.

You should be able to telnet into your server from a remote system
on port 2401 to your pserver box. If not, perhaps you haven't
opened up your iptables firewall for access to this port?
---

how can I do that with iptables temporarily?

- Gergely
