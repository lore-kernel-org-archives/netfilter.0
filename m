From: "Umar Qureshey" <umar.qureshey@lantronix.com>
Subject: Statically linked ebtables not working
Date: Wed, 26 May 2010 18:36:31 -0700
Message-ID: <F24C979D1AFD4E4292B911441CBA242407FCE6@2putt.int.lantronix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am working on a 32-bit ARM system.

I compiled and statically linked ebtables v2.0.9-2 using the "make
static" build command.

However when I run it on the system, I get the following message from my
Linux 2.6.28 kernel:

# ./ebtables -L
modprobe: module ebtables not found in modules.dep
The kernel doesn't support the ebtables 'filter' table.

Now I assumed I compiled this statically so I would not need any
external module support so I am dumbfounded by this message.  I looked
through the kernel compilation settings and didn't see anything relevant
to ebtables or netfilter.  From my understanding, ebtables code is now
part of the mainstream kernel (has been for a while).

So I am not sure why this is happening.

Anyone have advice on what could be happening here?

Regards,
Umar
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
