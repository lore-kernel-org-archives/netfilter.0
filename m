From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Question about conntrack
Date: Sat, 24 Oct 2009 14:51:31 +0200
Message-ID: <4AE2F853.4010907@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,
I have a server that nat a network lan where there are some pcs. My
provider say me that I'm uploading contents from an high (5XXXX)
external udp port. For see if it's true :) and which lan ip do the
upload (of course excluding the server) I "tcpdump" the connection and I
see that yes, there is an upload that goes out from the wan (that has a
public IP) at that specific port, but no corresponding lan traffic on
the lan port.

Here are my question: why I see the traffic on that port only on the
external port? nat does also port translation?
Is there another, better, solution for look for the data that I need?

Thanks,
Michele
