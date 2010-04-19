From: "Jeff Saremi" <jeffsaremi@yahoo.com>
Subject: RE: SO_ORIGINAL_DST returning bogus port number
Date: Mon, 19 Apr 2010 17:30:03 -0400
Message-ID: <004301cae007$791f2e80$6b5d8b80$@com>
References: <003f01cadff7$8ebeb720$ac3c2560$@com> <alpine.LSU.2.01.1004192206330.30616@obet.zrqbmnf.qr> <alpine.LSU.2.01.1004192212420.30616@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1004192212420.30616@obet.zrqbmnf.qr>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jan Engelhardt' <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks a lot for responding.
The key was " ntohs()" which i didn't have and you mentioned. It works properly now.

>
>You have to use
>
>else {
>	char buf[16];
>	inet_ntop(AF_INET, &dst_addr.sin_addr, dst, sizeof(dst));
                                               ^ buf, not dst

>	printf("%s:%hu\n", buf, ntohs(dst_addr.sin_port));
>}

