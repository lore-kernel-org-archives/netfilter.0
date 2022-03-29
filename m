From: Frank Wunderlich <frank-w@public-files.de>
Subject: Aw: Fw: nftables portknocking
Date: Tue, 29 Mar 2022 17:31:44 +0200
Message-ID: <trinity-3c753dd7-a93f-4833-aee3-9dc0f1837d4c-1648567904310@3c-app-gmx-bs05>
References: <trinity-a562df00-31ef-40b9-9a08-4b842eca8f0e-1647086495600@3c-app-gmx-bs23>
 <trinity-9d8181c6-0f95-4798-ab11-17b63f7de864-1648567419132@3c-app-gmx-bs05>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648567904;
        bh=o2MwzYehWdbV4jfnQIzi0+QPQaYNNoeAagOHCscW5sE=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=W4bDvKdhfWqZXch52wodf49hfNDfnELWkhbe/CVCVRsY33LKbhof50LlEKop+NrgY
         RT7drUvfhX+z8xmlBkj4EC9cbJZn8uDCRDcvE6quLlR05hCB7SebIy6s16TY4aShHN
         h3+z+tCtHlyTT3eQCFkHulrl5ROSzthVDKDr+jQQ=
In-Reply-To: <trinity-9d8181c6-0f95-4798-ab11-17b63f7de864-1648567419132@3c-app-gmx-bs05>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

got portknocking basicly working, currently only for ssh (of course changed ports in my config ;) )

define pkport1=123
define pkport2=234
define pkport3=345
define pkport4=456

    chain PortKnock {
        tcp dport $pkport1 add @candidates_ipv4 {ip  saddr . $pkport2 timeout 1s}
        tcp dport $pkport2 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . $pkport3 timeout 1s}
        tcp dport $pkport3 ip  saddr . tcp dport @candidates_ipv4 add @candidates_ipv4 {ip  saddr . $pkport4 timeout 1s}
        tcp dport $pkport4 ip  saddr . tcp dport @candidates_ipv4 add @clients_ipv4 {ip  saddr timeout 10s} log prefix "Successful v4 portknock: "


        tcp dport ssh ip  saddr @clients_ipv4 ct count 5 counter accept comment "ratelimited ssh"

        tcp dport $guarded_ports ct state established,related counter accept

        iifname $ifexternal tcp dport $guarded_ports counter reject with tcp reset
    }

as far as i tested it, it opens the port (ssh) only for a short period (~5s) then closes it. so connection needs to be establishes in this short time. after closing connection port gets closed too...so far so good. imho i can increase the time with the timeout-setting, right?

how to handle ports which have no permanent traffic like http(s)? how to add the port-opening to nat-table (forwarding)?

have defined it like this (currently limited to internal interfaces by prefix "iifname != $ifwan")

fib daddr type local tcp dport https dnat to $iplxcweb:https

regards Frank
