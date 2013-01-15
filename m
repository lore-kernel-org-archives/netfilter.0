From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: connlimit performance
Date: Mon, 14 Jan 2013 22:32:56 -0800
Message-ID: <CAJygYd1435Juip=6rMVyF5oQ7F53+eMB_ezAptJ0OVy7N02=aA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=/IjK+TbWd9x4/8czMnrUkWfXCTY1Vf3SSUBx3zJ3cCc=;
        b=mhRhnTaWlS+8tBCB1tTVmIzH4iW//oXDsQSK4X7pCxQ7Y37quZJB/bSoYxnjgNhaHP
         6DTs11uu2LINe7HyDQi/dWoY5laE/6kloKsIrhmsNWqTPSFlPX0e4VZbBtDgoLDBT5TH
         BbOIYKXnsB6yqn5CLMJjLenRvnjtoHH08GjEyyXHEd3rxgg4j0+xV1MvaNm55u4nM6JO
         8yRAC7vm32Ew0aGShSnn9rLwDVhuznmRLpMdNF+BUck5ar/g+06htQahykt14U2Cfe99
         RmQMiI4/UrTop0kv5dAQisCgW51ty6dA/OVj0xXVxV4kuepWwhW9Kjga7GQftWT+XXYQ
         2PFg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

Is anyone here have experience on connnlimit performance?   I am
trying to use it to limit connection per dest IP (about 1K of them )
on a 100Mbps firewall.  (without only about 70k connections) and as
soon as put this rule in, cpu usage sky raise.

On the otherhand, hashlimit works like a charm, with almost 0 cpu usage.

Cheers.
