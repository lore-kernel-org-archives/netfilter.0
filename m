From: "Walter H." <walter.h@mathemainzel.info>
Subject: Re: IPtables and HTTP/2-Push?
Date: Thu, 14 Sep 2017 14:24:22 +0200
Message-ID: <60f2d8bdad6dfa8aa5c2d403281667c6.1505391862@squirrel.mail>
References: <ba7e09d692a6bdb55ad32d7e106e33c7.1505378527@squirrel.mail>
    <CAK5rZE5RhzuHT+f+jpUGpzS7WnorSoUK8xtbOQLMSFjweTvmEg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:Message-ID; bh=9q2Et9waGR+6Ulbk0eOZUoKLZF/85o3gXlEoVjP6erg=;
        b=lk3qMDhSMEwmBp4g9U3amhIqfTubAQ9UDy3jvBAi4mpZInP1l2NYHT7A82USUEWjvsL2/D2JprzBPcVt/235qq5ydwNqGEH1E9e65WpQCBjUlKm4hoXs6piDr+D5j+ByAyeGfPphAoitZ6nTDdzxUWbH8CxkBa+O3tS8QGxwyIs=;
In-Reply-To: <CAK5rZE5RhzuHT+f+jpUGpzS7WnorSoUK8xtbOQLMSFjweTvmEg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Imran Geriskovan <imran.geriskovan@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, September 14, 2017 12:58, Imran Geriskovan wrote:
> On 9/14/17, Walter H. <walter.h@mathemainzel.info> wrote:
>> Hello,
>> when I have these two rules on client side (Browser)
>> or on firewalls/routers
>> what happens to to packets that the Server pushes without request?
>> I ask this because I see in the logs regularly a few entries like this
>> as I filtered away INVALID, I can imagine, that these blocked packets
>> come
>> from HTTP/2-Push ...
>> Am i right?
>
> As far as I know http2 pushes content over already open tcp
> connections.
connection vs. packet?

> So I guess that invalid packets are probably unrelated
> to http2.
these can't be invalid, as invalid packets got dropped before ...

