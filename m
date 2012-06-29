From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: dropping fragmented packetsusing iptables -f option
Date: Fri, 29 Jun 2012 12:43:19 +0530
Message-ID: <CAE1WnGfxNuu1yhySKaMF7LOVubHcyJg_o+n8N9Vt69A=z+BQFw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=oq4n/gZawJb6gZRci7APRsUsiFwZweNjIkXdSn4xiEU=;
        b=ZjkU0cZBHYp3a4HuiKivCX8mbutpxkFvxzh/Zq/Nn7Rc8E3M2LzkvAZF01XdRMi5Vn
         axFn+u1jdoWB6aueLq9DFxHB4SNl7YvatS3nMSnr3YUOJTTNZEDchl2OXiSHnf3sGO3L
         uDxy3RgdPMeroYzlep9QUdhXXVKZ8IiElAVdkC3dqsZCQ1gYqiBcDKXsWt4Qbk7d/3ya
         lgCbNv5981Rtfl0C2Vggk5fLpvmfKNejQns34PB7aWD8rF1P5DSUG6lNV9chOoAFx0i2
         PM9wfMtEnAKBFrynOiFstPXtbYJmtsTCbpvcte4Z5Bcn0j+fHMKsPpZ+oga8J1CkBrIi
         aveg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

my objective is to drop all fragmented packets on my system
following rules are used

iptables -A INPUT -f -j DROP
iptables -A OUTPUT -f -j DROP
iptables -A FORWARD -f -j DROP

above rules are not making any effect
For information, there is no connection tracking support on my
kernel.Since i understand that if connection tracking is enabled on
kernel then filtering based on fragmentation won't work, so i have
remeved connection tracking support.

i am using ping -s 32768 10.2.2.2 for generating fragments

Am i doing something wrong
or is there anything  that is conflicting with these rules


Thanks in advance.
