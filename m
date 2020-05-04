From: =?UTF-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>
Subject: [Help] Allow website using iptables
Date: Mon, 4 May 2020 13:53:49 +0700
Message-ID: <CAByCkvqDvxqzkCvt+J9tJatSk3K-TW2gAENojtnG7PvWKqO0YA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=1LRPsUuUOzMpup0eT9QFtZb+R4lR6PfOonGUsjjNh30=;
        b=LTYaYRP/X01yEwQ3Tk9xwZr/I5JrjaEsbuJiPDHEN3VaXTwN2mMC+EPjc1NIatlZTF
         iTBx01jn9gTg/QaLb19xgMZzeri2KSW2RX9r2pzHlL3lPR+8nrmHsMYWFG7YiCDE+uQX
         JsnGwURRgHoLgjABmFkppbDT3UpNzHG6Vt2sPKu4QOyvtriciE5B7rjRf0qtOHAC4ofe
         UhUeWVOtihlWtfwossCDdcPm60tpR2RBqcPRJmtttauF3Ib91Kfa2W3wKStVTHRCA2VH
         /gusVR5s/prCq6H5QLmjdrQj8L50+f/Xp+Z7vlbPfcLm83pLwvllbn+8cEM2+y0xRFYe
         6Y8Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a Linux router and using iptables 1.4 to configure the firewall.

And I want to permit a device to access a certain website with a
domain name and block other websites. So I have use some cmds in
iptables below:



iptables -N allow_chain
iptables -A FORWARD -j allow_chain
iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -m
string --algo bm --string youtube -j ACCEPT
iptables -A allow_chain -m mac --mac-source 11:22:33:44:55:66 -j DROP


In this case, I want computer with MAC address 11:22:33:44:55:66
connected to my Linux router can only access the youtube . But the
result was not my expectation, after I apply those rules , my computer
cannot access to youtube and other web also, it drop all internet
connection . In my understanding, the rule with ACCEPT target was not
apply even the package match with the condition, and all packages are
handled in the rule with DROP target.

So is there any thing wrong with my cmd? What was the problem ?

Please help me, Thanks.
