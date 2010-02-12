From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 00:18:42 +0100
Message-ID: <1266016722.2980.159.camel@tesla.lan>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
> Telnet from inside machine to www.google.com 80 works but I can't get
> any messages after I get connected (Just successfull telnet
> connection)

You can't telnet www.google.com on port 80, as google is not a telnet
server and therefore it can't deal with the telnet protocol. Google
deals with the http protocol.

If you can use your web browser then you are fine, it means NAT is
working.

You could try telnet or other TCP/IP protocols but you need appropriate
servers for them.

If you want to try telnet and you don't know any telnet server, you
could try telnet on port 25 to your smtp mail server. At least you can
have a basic dialogue with it (refer to the smtp protocol, there are
HELO, MAIL, QUIT and other commands that you can issue).

I hope it helps.

Bye,

Guido

