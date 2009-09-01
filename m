From: =?ISO-8859-2?Q?Micha=B3_Sewera?= <michal.sewera@gmail.com>
Subject: unknown conntrack layer 3 protocol
Date: Tue, 1 Sep 2009 18:34:16 +0200
Message-ID: <875a14c20909010934g4fc1f61fo33241fd95ba67486@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=udcjxBVnbuRFj4Py+a7DKYnenisv5muzwtdk5e+hwAA=;
        b=ZCVn+AKHcpET+vDeXAeZ6WR+kMw0N93VqgPCOSgVS2oifVIuV1lxDXBbvEDC6mz8eP
         qWB6824iSXyqHbv2KeQ6495xjl15wUyAyRrBLxgsTnmqhmJ6e6o4XXZBgFom+kQCEVGk
         /S/b+f8iyrNcGmVmPTkImaikI+yhKn9ta4Cxw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

after starting conntrackd in statistics mode in conntrack.log I see
lot of "unknown conntrack layer 3 protocol" messages, and output from
statistics is empty, as seen below:

conntrackd -s
cache stats:
current active connections:                0
connections created:                       0    failed:            0
connections updated:                       0    failed:            0
connections destroyed:                     0    failed:            0

traffic processed:
                   0 Bytes                         0 Pckts


In the same time conntrack -L lists all connections, so it seems
tracking is working...

Does anyone knows what could be the reason ?

thanks
m
