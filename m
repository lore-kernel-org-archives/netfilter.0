From: "Ashwini R" <ashwinir.11@gmail.com>
Subject: Setting source routing option using netfilter
Date: Tue, 11 Dec 2007 16:35:15 -0700
Message-ID: <c0549e500712111535g4d9ba530n47a346b32d3b6b84@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=4oHOSYEsITnmqamAi9HKky0xsbrFCS7UkP/s/9ZTPAM=;
        b=S0R1fteLMlOeu16UK/C7P7H7EwVOaOWfyi6DJRk1ERs7rIV18SwJIohfukUAVJKeK8P66XuHkEU66Hf/KZRgGO9eEJHzBGvyVQMN/Nk9mnjJSQ/BYv9DqvTUo3a2HITzi6jn4EArgf+RJnIJrwznuSfK9TouiJEDOHGRFEOrAko=
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I am trying to dynamically add IP_Options to the packet header in
2.6.23 kernel to perform strict source routing. I am using Netfilter
hooks (NF_IP_LOCAL_OUT hook) to intercept the packet before it goes
out of the host. If the IP_Options are set through setsockopt() in my
application, I am able to read those options using Netfilter. However,
I am not sure how to insert new IP_Options into packets originating
from another application. Could anyone please point me to some
documentation or sample code regarding this.

Thank you,

Ashwini.
