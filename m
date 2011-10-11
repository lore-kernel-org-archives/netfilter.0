From: julioarr@fisica.uh.cu
Subject: [Fwd: how to filter with layer7??]
Date: Tue, 11 Oct 2011 13:26:32 -0400
Message-ID: <7695350de0ed0af3448e11288b3cd653.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: netfilter-devel@vger.kernel.org

>
>hi all,
>
>I rebuild my kernel with layer7-support. All is working ok. But, I need
>filter the TCP-SSL/TLS-forward-connections packets from a client to the
>server ($SERVER_IP:443) by layer7 protocols. How I can do this?
>

just to redirect some forward-packets that match some layer7 condition to
other destination

>
>thanks,
>julio
>

