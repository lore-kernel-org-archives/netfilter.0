From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: conntrack output - question
Date: Mon, 6 Aug 2012 22:38:03 -0700
Message-ID: <CAAJpzgba1eL73KxNZWLU7DxJsrZitdb2WkUOe=An_J-Q677+sg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=ntCB5jpna3SlPH5yhCFiPByBzfX7JCmBnSLp0DAl0MY=;
        b=ftzjpy/6aehpVgNLTsENJYbqxVRncMjO77bNftJIRZwO88pybNCUlpsapLUPyQFzVk
         6SVczNz9IdJUD8a/gu/AAkD+OuzaezeBldtWr5bch1i4a271tLGrtOc6IYYCNZE28xdf
         B/Ufb0l3oVglMpxidzBI3ZURigfc5mzm/hxu5T7HIvyjPUUCv3orankP21XBD0Rr4aOO
         NwB1VrHmD2hOrhyb1WhadcTV+mgaOphjWmFlb3d/jaRJOc4rWQ3mW8mPk1h0JBjkIzt0
         MYeFoYYJ5KhorfkQZh5bDMxvqIvet5/5qR/VnpnYDE+m2hOY//YVP6nvKs5rZrSY+tlZ
         2pcg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Conntrack classifies a packet to a flow based on protocol no, srcip,
destip, srcport, and destport.

A sample output is shown below,

[NEW] udp      17 30 src=192.168.2.100 dst=192.168.2.1 sport=57767
dport=53 [UNREPLIED] src=192.168.2.1 dst=192.168.2.100 sport=53
dport=57767

Here, what's the need of reply srcip, reply destip, reply srcport,
reply destport? (Since we can imply these information from original
srcp ip, original destip, original srcport, original destport)
Is it just for avoiding for confusion, or anyother reasons behind this?

Thanks & Regards,
