From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Fwd: ipset 6.24 and iptables 1.4.14, errno 22 (EINVAL)
Date: Tue, 16 Dec 2014 15:31:22 +0100
Message-ID: <CAHOuc7MEuNd85gv_L0LCdY7cKd=7Je6-a+rUh_dz7D2haEW9KA@mail.gmail.com>
References: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=msZcoJTZfhm0WsG2Of3si6Eii5yJ0SZMoute9gMLCaM=;
        b=dVkd+hfOotXAlgLsxtV9LbzfJPD9ESsOZZuMw2TyxPfO1LYNsuLOM8p+iXG9ZGDsIP
         mYQOGyJl8+UZRZPZy1IB+gpvCecI8lQN/mDVTjhLX9dXqRnq18un09pHGTK09riXyDRl
         Jbq+5cYjjpEjlK2ZwJWx34CCujJ2tYqtFsXGNtGtIOBw3a7N7TnHnrMHkL7gHmcR7pIR
         8BBmwltYDOw/yen+CyaGBpnjvOx+lCCcl9P/xKEdvKI3ccE8DRY8QWs2MplZf+348OzA
         LVIyXlrqew4APpdNyaoOh70G5LCGy0Fwi1jRHMWFg/rNAQr0QEe5cmuav2I8n1ilm50W
         +gAQ==
In-Reply-To: <CAHOuc7PVsLGVjOZSMNQfSmhfcd_tKfoD58mjbrQ89BtJN8M19g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,

When using iptables and the set match we receive:

iptables v1.4.14: Problem when communicating with ipset, errno=22.


We are, quite accidentally, using ipset 6.24 (kernel and userspace),
with iptables (including its libxt_set userspace module) 1.4.14. Might
the problem be incompatibilities between these versions, since they
are quite far apart?

The ipset command itself works, and we can define the sets in the kernel.


/Oskar
