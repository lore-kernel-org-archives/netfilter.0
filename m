From: Karsten Hohmeier <karsten.hohmeier@tu-ilmenau.de>
Subject: Re: Parsing conntrack entries
Date: Fri, 02 Jan 2015 01:10:58 +0100
Message-ID: <m84nn2$mv7$1@ger.gmane.org>
References: <54A5C6CE.6090409@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54A5C6CE.6090409@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Dennis,

> What is the best way to parse this information in a reliable way?

Maybe you could try dumping the table in XML as mentioned by the manpage?

conntrack -L -o xml
    Dump the connection tracking table in XML

Best Regards

Karsten

