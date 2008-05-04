From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Filtering module on OSI level 7?
Date: Sun, 4 May 2008 19:57:26 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805041954160.11757@fbirervta.pbzchgretzou.qr>
References: <DBB76FAC-A063-498C-812B-B785C6C0C724@unifr.ch> <200805021515.48361.ben@differentialschokolade.org> <alpine.LNX.1.10.0805021600580.6463@fbirervta.pbzchgretzou.qr> <200805030608.20299.ben@differentialschokolade.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200805030608.20299.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benedikt Gollatz <ben@differentialschokolade.org>
Cc: netfilter@vger.kernel.org


On Saturday 2008-05-03 06:08, Benedikt Gollatz wrote:

>On Friday 02 May 2008 16:01:29 you wrote:
>> > If you don't trust an application to behave correctly, you also cannot
>> > trust it not to use other applications via IPC to connect to the
>> > Internet.
>>
>> But you can catch the fact that it does use IPC.
>
>How exactly would you do that? There are myriads of ways to do IPC.

Security modules were meant to catch just that. To inhibit IPC,
you could try Apparmor (dunno if it already handles all ipc cases).
