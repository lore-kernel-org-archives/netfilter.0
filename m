From: Narendra Choyal <narendrachoyal@gmail.com>
Subject: Re: HELP: how to block faked RST packet
Date: Sat, 12 Jun 2010 19:42:09 +0530
Message-ID: <AANLkTikRgRaIUe4WLIJanGp0Q8et1LXYJHu0PyyjFwc2@mail.gmail.com>
References: <AANLkTin10l7SVMgOS6SUU8IZruGsbjrJoopVqn6uZtCP@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=crnl0QfnQkUblmeCNbhETZ/WjWLPXsN11W8kzkSx28c=;
        b=ugsOLkcJIshuwLXV5lUPA5X3zpE3nKFb+P8rvdYX6aBmplZer7rF/DtAbj2b76Ob+9
         V2ydK/PLAOp0m6vH+S6dQunfS90UqFoDWRgroRot/PIQaPQQGyTxiQ/TTqy2DQ/MNrKK
         axkP22+xhlKKu4K1ocnUmC/VAScRBG5a6B/nk=
In-Reply-To: <AANLkTin10l7SVMgOS6SUU8IZruGsbjrJoopVqn6uZtCP@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?B?6LW15pum?= <pagonz@gmail.com>
Cc: netfilter@vger.kernel.org

 iptables -A INPUT -p tcp -i eth0 --tcp-flags ACK,SYN,FIN,RST,URG,PSH
RST -j DROP

if you are using above iptable rule then this will stop breaking of
the the connection, like if you make a ssh connection then this will
not break connection.
So use a IDS (Intrusion Detection System) like Snort.
And that refreshing of the page can lead to fill backlog memory area.
