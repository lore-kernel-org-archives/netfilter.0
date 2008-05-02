From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering module on OSI level 7?
Date: Fri, 2 May 2008 16:01:29 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805021600580.6463@fbirervta.pbzchgretzou.qr>
References: <DBB76FAC-A063-498C-812B-B785C6C0C724@unifr.ch> <200805021515.48361.ben@differentialschokolade.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805021515.48361.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org


On Friday 2008-05-02 15:15, Benedikt Gollatz wrote:

>On Friday 02 May 2008 14:20:44 you wrote:
>> I would nevertheless prefer something similar to LittleSnitch
>> (http://www.obdev.at/products/littlesnitch/index.html) on OS X or to
>> ZoneAlarm on Windows.
>
>Why? Filtering traffic by application (which is different from filtering 
>traffic based on the application layer) doesn't add anything to security. If 
>you don't trust an application to behave correctly, you also cannot trust it 
>not to use other applications via IPC to connect to the Internet.

But you can catch the fact that it does use IPC. There is
tuxguardian.sourceforge.net, but it has not really be touched since 2.6.16.
