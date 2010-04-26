From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re[2]: snat --persistent
Date: Mon, 26 Apr 2010 21:35:58 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004262135270.1232@obet.zrqbmnf.qr>
References: <1393124438.20100427001703@mail.ru> <37141272306875@web115.yandex.ru> <1745780553.20100427011831@mail.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1745780553.20100427011831@mail.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mindb0t@mail.ru
Cc: "\"Oleg A. Arkhangelsky\"" <sysoleg@yandex.ru>, netfilter@vger.kernel.org

On Monday 2010-04-26 21:18, mindb0t@mail.ru wrote:

>Did I understand write that connection means myserver->twitter, and
>myserver->facebook will be another connection?
>
>I want to know if it doesn't matter how many time I will request
>twitter - it will be only one connection, right?

Depends on whether you are using HTTP pipelining or not, but in either 
case, rest assured that it can easily be more than one connection.
